package com.example.lbf.imatationofwechat;

import android.app.Application;
import android.content.Context;

public class App extends Application {
    public static Context appContext;

    @Override
    public void onCreate() {
        super.onCreate();
        appContext=this;
    }

    /*
     * 获得全局上下文
     */
    public static Context getAppContext() {
        return appContext;
    }

}
