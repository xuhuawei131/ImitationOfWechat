-dontoptimize
-ignorewarnings						# 忽略警告，避免打包时某些警告出现
-optimizationpasses 5				# 指定代码的压缩级别
-dontusemixedcaseclassnames			# 是否使用大小写混合
-dontskipnonpubliclibraryclasses	# 是否混淆第三方jar
-dontpreverify                      # 混淆时是否做预校验
-verbose                            # 混淆时是否记录日志
-dontwarn
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*        # 混淆时所采用的算法
-keepattributes SourceFile,LineNumberTable  #保持行数

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.app.View
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference

#sharesdk
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class **.R$* {*;}
-keep class **.R{*;}
-dontwarn cn.sharesdk.**
-dontwarn **.R$*

#友盟统计
-keepclassmembers class * {
   public <init>(org.json.JSONObject);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

#other
-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclassmembers class * extends com.hyena.coretext.blocks.CYBlock {
*;
}

-keep class **.R$* {
*;
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keepattributes *Annotation*
-keep class * extends java.lang.annotation.Annotation { *; }

-keep @com.hyena.framework.annotation.NotProguard class * {*;}
-keep @com.hyena.framework.annotation.Scene class * {*;}
-keep class * {
    @com.hyena.framework.annotation.NotProguard <fields>;
}
-keepclassmembers class * {
    @com.hyena.framework.annotation.NotProguard <methods>;
}

#不混淆android-async-http
-keep class com.loopj.android.http.**{*;}

 #不混淆org.apache.http.legacy.jar
-dontwarn android.net.compatibility.**
-dontwarn android.net.http.**
-dontwarn com.android.internal.http.multipart.**
-dontwarn org.apache.commons.**
-dontwarn org.apache.http.**
-keep class android.net.compatibility.**{*;}
-keep class android.net.http.**{*;}
-keep class com.android.internal.http.multipart.**{*;}
-keep class org.apache.commons.**{*;}
-keep class org.apache.http.**{*;}
-keep class com.baidu.**{*;}
-keep class com.chivox.**{*;}

# ProGuard configurations for Bugtags
  -keepattributes LineNumberTable,SourceFile
  -keep class com.bugtags.library.** {*;}
  -dontwarn com.bugtags.library.**
  -keep class io.bugtags.** {*;}
  -dontwarn io.bugtags.**
  -dontwarn org.apache.http.**
  -dontwarn android.net.http.AndroidHttpClient
  # End Bugtags

  # ijkplayer
 -dontwarn tv.danmaku.ijk.media.player.**
 -keep class tv.danmaku.ijk.media.player.**{*;}
 -keep class com.badlogic.gdx.**{*;}

 #RJReading
 -keepattributes *Annotation*
 -keepclassmembers class ** {
 @org.greenrobot.eventbus.Subscribe <methods>;
 }
 -keep enum org.greenrobot.eventbus.ThreadMode { *; }
 -keepnames class com.liulishuo.okdownload.core.connection.DownloadOkHttp3Connection
 -keep class com.liulishuo.okdownload.core.breakpoint.BreakpointStoreOnSQLite {
         public com.liulishuo.okdownload.core.breakpoint.DownloadStore createRemitSelf();
         public com.liulishuo.okdownload.core.breakpoint.BreakpointStoreOnSQLite(android.content.Context);
 }
 -dontwarn com.liulishuo.**
 -keep class com.liulishuo.okdownload.** {*;}
 -keep class com.rjsz.frame.download.callback.CallbackBridge{*;}
 -keep class com.rjsz.frame.diandu.PRDownloaderManager{
      public *;
 }
 -keep class com.rjsz.frame.diandu.PRSDKManager{
      public *;
 }
 -keep class com.rjsz.frame.diandu.PRViewManager{
      public *;
 }
 -keep class com.rjsz.frame.diandu.config.PRStateCode{ *; }
 -keep class com.rjsz.frame.diandu.callback.ReqCallBack{ *; }
 -keep class com.rjsz.booksdk.bean.* { *; }
 -keep class com.rjsz.frame.diandu.event.* { *; }
 -keep class com.rjsz.frame.diandu.bean.* { *; }
 -keep class com.rjsz.frame.diandu.webview.bean.* { *; }
 -keep class com.rjsz.frame.diandu.utils.PRFileUtil { *; }
 -keep class com.rjsz.frame.pepbook.bean.*{ *; }
 -keep class com.rjsz.frame.pepbook.config.*{ *; }
 -keep class com.rjsz.frame.pepbook.download.*{ *; }
 -keep class com.rjsz.frame.pepbook.event.*{ *; }
 -dontwarn com.edmodo.cropper.**
 -keep class com.edmodo.cropper.** {*;}
 -keep class com.foxit.sdk.** { *; }
 -keep class com.foxit.uiextensions.** { *; }
 -dontwarn com.foxit.sdk.**
 -dontwarn  com.foxit.uiextensions.**
 -dontwarn com.iflytek.**
 -keep class com.iflytek.**{*;}
 #end RJReading


#start kefu
-keep class com.superrtc.** {*;}
-keep class com.hyphenate.** {*;}
-dontwarn com.hyphenate.**

 #如添加华为push
 # Huawei push
 -keep class com.huawei.android.pushagent.** {*;}
 -keep class com.huawei.android.pushselfshow.** {*;}
 -keep class com.huawei.android.microkernel.** {*;}
 -keep class com.baidu.mapapi.** {*;}
 -keep class com.hianalytics.android.** {*;}
 -dontwarn com.huawei.android.pushagent.**
 -dontwarn com.huawei.android.pushselfshow.**
 -dontwarn com.huawei.android.microkernel.**
 -dontwarn com.github.mikephil.charting.data.**
#end kefu

-keep class com.umeng.commonsdk.** {*;}
-keep class com.knowbox.rc.modules.parentreward.beans.* { *; }
#Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
-keep class com.knowbox.rc.modules.playnative.base.keyboard.**{*;}
-keep class com.hyena.handwriting.**{*;}
-keep class com.knowbox.rc.commons.widgets.calendarview.**{*;}

# miniPlugIn
-keep class com.hyena.miniplugin.hook.impl.**{*;}

# mp4parser相关
-keep class com.mp4parser.** {*;}
-keep class org.mp4parser.** {*;}
-keep class com.coremedia.** {*;}
-keep class com.googlecode.** {*;}
-keep class org.aspectj.** {*;}

#growingio相关
-keep class com.growingio.** {
    *;
}
-dontwarn com.growingio.**
-keepnames class * extends android.view.View
-keepnames class * extends android.app.Fragment
-keepnames class * extends android.support.v4.app.Fragment
-keepnames class * extends androidx.fragment.app.Fragment
-keep class android.support.v4.view.ViewPager{
    *;
}
-keep class android.support.v4.view.ViewPager$**{
	*;
}
-keep class androidx.viewpager.widget.ViewPager{
    *;
}
-keep class androidx.viewpager.widget.ViewPager$**{
	*;
}

#Unity相关
-keep class bitter.jnibridge.* { *; }
-keep class com.unity3d.player.* { *; }
-keep class org.fmod.* { *; }
-keep class cn.knowbox.UnityFrameWork.* { *; }
-keep class com.knowbox.unity.* { *; }

-keepnames class * extends android.view.View
-dontwarn android.support.**
-keep class android.support.** {
    *;
}

-keep class com.growingio.android.sdk.collection.GrowingIOInstrumentation {
    public *;
    static <fields>;
}

#云知声相关
-keepattributes Exceptions,InnerClasses,...
-keep class cn.yunzhisheng.oralEdu{*;}
-keep class cn.yunzhisheng.oraleval.sdk.OpusEncoder{*;}
-keep class com.unisound.jni.UniVadnn{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.IOralEvalSDK{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.IOralEvalSDK$*{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.OralEvalSDKFactory{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.OralEvalSDKFactory$*{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.SDKError{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.SDKError$*{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.OralEvalModel{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.utils.LogBuffer{*;}
-keep class com.unisound.edu.oraleval.sdk.sep15.utils.OralEvalEnum{*;}

# 保留枚举类不被混淆
-keepclassmembers enum * {
public static **[] values();
public static ** valueOf(java.lang.String);
}

# Ping++ 混淆过滤
-dontwarn com.pingplusplus.**
-keep class com.pingplusplus.** {*;}

# 支付宝混淆过滤
-dontwarn com.alipay.**
-keep class com.alipay.** {*;}

# 微信或QQ钱包混淆过滤
-dontwarn  com.tencent.**
-keep class com.tencent.** {*;}

# 银联支付混淆过滤
-dontwarn  com.unionpay.**
-keep class com.unionpay.** {*;}

# 招行一网通混淆过滤
-keepclasseswithmembers class cmb.pb.util.CMBKeyboardFunc {
    public <init>(android.app.Activity);
    public boolean HandleUrlCall(android.webkit.WebView,java.lang.String);
    public void callKeyBoardActivity();
}

# 内部WebView混淆过滤
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}


#recyclerViewAdapter
-keep class com.knowbox.rc.widgets.recyclerviewadapter.** {
*;
}
-keep class * extends com.knowbox.rc.widgets.recyclerviewadapter.BaseQuickAdapter{ *; }
-keep class * extends com.knowbox.rc.widgets.recyclerviewadapter.BaseViewHolder{ *; }
-keepclassmembers  public class **$** extends com.knowbox.rc.widgets.recyclerviewadapter.BaseViewHolder {
     <init>(...);
}

-keep class com.knowbox.rc.commons.recyclerview.recyclerviewadapter.** {*;}
-keep public class * extends com.knowbox.rc.commons.recyclerview.recyclerviewadapter.BaseQuickAdapter{ *; }
-keep public class * extends com.knowbox.rc.commons.recyclerview.recyclerviewadapter.BaseViewHolder{ *; }
-keepclassmembers public class **$** extends com.knowbox.rc.commons.recyclerview.recyclerviewadapter.BaseViewHolder {
           <init>(...);
}

-dontwarn com.igexin.**
-keep class com.igexin.** { *; }
-keep class org.json.** { *; }

-keep  class net.sqlcipher.** {*;}
-keep  class net.sqlcipher.database.** {*;}
#一键登录
-keep class cn.com.chinatelecom.gateway.lib.** {*;}
-keep class com.unicom.xiaowo.login.** {*;}
-keep class com.cmic.sso.sdk.** {*;}
-keep class com.mobile.auth.gatewayauth.** {*;}
-keep class android.support.v4.** { *;}
-keep class org.json.**{*;}
-keep class com.alibaba.fastjson.** {*;}
#阿里云
-keep class com.alibaba.sdk.android.oss.** { *; }
-dontwarn okio.**
-dontwarn org.apache.commons.codec.binary.**
