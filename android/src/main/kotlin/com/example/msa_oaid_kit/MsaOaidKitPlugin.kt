package com.example.msa_oaid_kit

import android.content.Context
import androidx.annotation.NonNull
import com.example.msa_oaid_kit.DemoHelper.AppIdsUpdater
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MsaOaidKitPlugin */
class MsaOaidKitPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var demoHelper: DemoHelper
    private var applicationContext: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "msa_oaid_kit")
        channel.setMethodCallHandler(this)

        applicationContext = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//        if (call.method == "getPlatformVersion") {
//            result.success("Android ${android.os.Build.VERSION.RELEASE}")
//        } else {
//            result.notImplemented()
//        }

        if (call.method == "getOaid") {
            demoHelper = DemoHelper(object : AppIdsUpdater {
                override fun onIdsValid(ids: String) {
                    result.success(ids)
                }
                override fun onIdsError(errCode: Int, err: String) {
                    result.error(errCode.toString(), err, null)
                }
            })
            demoHelper.getDeviceIds(applicationContext, true, false, false)
        }else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        applicationContext = null
    }

}
