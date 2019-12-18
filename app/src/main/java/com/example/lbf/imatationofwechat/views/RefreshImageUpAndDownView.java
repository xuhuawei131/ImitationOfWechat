package com.example.lbf.imatationofwechat.views;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;

import com.example.lbf.imatationofwechat.R;

import static android.animation.ValueAnimator.RESTART;


public class RefreshImageUpAndDownView extends View {
    private static final int TOTAL_IMAGE_SIZE = 7;
    private Bitmap frame[] = new Bitmap[TOTAL_IMAGE_SIZE];
    private Matrix mMatrix;

    private float progress=0;
    private int index=0;

    private int PAGE_ITEM_HEIGHT=0;
    private int ITEM_HEIGHT=0;
    private int TOTAL_ITEM_HEIGHT=0;
    private ValueAnimator repeatAnimator;
    private ValueAnimator endingAnimator;
    public RefreshImageUpAndDownView(Context context) {
        super(context);
        init();
    }

    public RefreshImageUpAndDownView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RefreshImageUpAndDownView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        mMatrix = new Matrix();
        frame[0] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_1);
        frame[1] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_2);
        frame[2] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_3);
        frame[3] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_4);
        frame[4] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_5);
        frame[5] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_6);
        frame[6] = BitmapFactory.decodeResource(getContext().getResources(), R.drawable.anim_refresh_7);
    }


    private Animator.AnimatorListener endStatusListener=new Animator.AnimatorListener(){
        @Override
        public void onAnimationStart(Animator animation) {

        }

        @Override
        public void onAnimationEnd(Animator animation) {
            if (listener!=null){
                listener.onRefreshAnimFinish();
            }
        }

        @Override
        public void onAnimationCancel(Animator animation) {

        }

        @Override
        public void onAnimationRepeat(Animator animation) {

        }
    };

    private ValueAnimator.AnimatorUpdateListener endingUpdateListener=new ValueAnimator.AnimatorUpdateListener(){
        @Override
        public void onAnimationUpdate(ValueAnimator animation) {
            int value= (int) animation.getAnimatedValue();
            setProgress(value);
        }
    };


    private ValueAnimator.AnimatorUpdateListener repeatUpdateListener=new ValueAnimator.AnimatorUpdateListener(){
        @Override
        public void onAnimationUpdate(ValueAnimator animation) {
            int value= (int) animation.getAnimatedValue();
            setProgress(value);
            if (value==0){
                startRefreshAnim();
            }
        }
    };
    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int height=MeasureSpec.getSize(heightMeasureSpec);
        setMeasuredDimension(frame[0].getWidth(),height);
        ITEM_HEIGHT = getMeasuredHeight()+frame[0].getHeight();
        PAGE_ITEM_HEIGHT = getMeasuredHeight();
        TOTAL_ITEM_HEIGHT=ITEM_HEIGHT*TOTAL_IMAGE_SIZE;

    }
    private int lastTop=0;
    private float lastProgress=0;

    public void setProgress(int top) {
        top= (int) (top*2.5);
        progress = top % ITEM_HEIGHT;
        if (Math.abs(progress-lastProgress)>PAGE_ITEM_HEIGHT){
            if (top>lastTop){
                index++;
                index = index > TOTAL_IMAGE_SIZE-1 ? 0 : index;
            }else{
                index--;
                index = index <0 ? TOTAL_IMAGE_SIZE-1 : index;
            }
        }
        lastTop=top;
        lastProgress=progress;
        invalidate();
    }

    public interface OnRefreshAnimFinishListener{
        public void onRefreshAnimFinish();
    }

    private OnRefreshAnimFinishListener listener;
    public void setOnRefreshAnimFinishListener(OnRefreshAnimFinishListener listener){
        this.listener=listener;
    }


    public boolean isRefreshAnimRunning(){
        if (endingAnimator==null){
            return false;
        }
        return endingAnimator.isRunning();
    }


    public void stopRefrshAnim(){
        if (repeatAnimator !=null){
            repeatAnimator.cancel();

            if (endingAnimator!=null&&endingAnimator.isRunning()){
                endingAnimator.cancel();
            }
            endingAnimator = ValueAnimator.ofInt((int) (progress+ITEM_HEIGHT*2),(PAGE_ITEM_HEIGHT-getFrame().getHeight())/2);
            endingAnimator.setDuration(3000);
            endingAnimator.addUpdateListener(endingUpdateListener);
            endingAnimator.addListener(endStatusListener);
            endingAnimator.setInterpolator(new DecelerateInterpolator());
            endingAnimator.start();
        }
    }



    public void startRefreshAnim(){
        repeatAnimator = ValueAnimator.ofInt(TOTAL_ITEM_HEIGHT,0);
        repeatAnimator.setDuration(3000);
        repeatAnimator.setRepeatMode(RESTART);
        repeatAnimator.addUpdateListener(repeatUpdateListener);
        repeatAnimator.setInterpolator(new LinearInterpolator());
        repeatAnimator.start();

    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        Bitmap bitmap=getFrame();
        final int saveCount = canvas.save();
        canvas.translate(0, progress-bitmap.getHeight());
//        matrix.postTranslate(arrowImageMarginLeft, dpToPixel(getContext(), 12));
        canvas.drawBitmap(getFrame(), mMatrix, null);
        canvas.restoreToCount(saveCount);
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (repeatAnimator.isRunning()){
            repeatAnimator.cancel();
        }
        if (endingAnimator.isRunning()){
            endingAnimator.cancel();
        }
    }

    private Bitmap getFrame() {
        return frame[index];
    }
}
