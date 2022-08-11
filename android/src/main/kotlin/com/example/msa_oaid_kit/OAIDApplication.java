package com.example.msa_oaid_kit;

import android.app.Application;

public class OAIDApplication extends Application{
    @Override
    public void onCreate() {
        super.onCreate();
        System.loadLibrary("msaoaidsec");  // TODO （3）SDK初始化操作
    }

}
