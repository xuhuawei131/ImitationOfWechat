package com.example.lbf.imatationofwechat.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;

import com.example.lbf.imatationofwechat.R;


public class RefreshImageUpAndDownView extends View {
    private static final int TOTAL_IMAGE_SIZE = 7;
    private Bitmap frame[] = new Bitmap[TOTAL_IMAGE_SIZE];
    private Matrix mMatrix;

    private float progress=0;
    private int index=0;

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


    public void setProgress(int top) {
        top= (int) (top*2.5);
        int viewHeight = getMeasuredHeight()+frame[0].getHeight();
        index = Math.abs(top / viewHeight);
        index = index >= TOTAL_IMAGE_SIZE ? 0 : index;
        progress = top % viewHeight;
        invalidate();
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

    private Bitmap getFrame() {
        return frame[index];
    }
}
