package tr.com.iwallet.i_updater

import android.content.Context
import android.content.pm.PackageManager
import android.content.Intent
import android.content.pm.PackageInfo
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tr.com.iwallet.i_updater.constants.UpdaterConstants

/** IUpdaterPlugin */
class IUpdaterPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            UpdaterConstants.METHOD_CHANNEL_NAME
        )
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            UpdaterConstants.GET_APP_VERSION -> result.success(getAppVersion())
            UpdaterConstants.APP_ID -> result.success(context.packageName)
            UpdaterConstants.OPEN_STORE -> {
                val url: String? = call.argument<String>(UpdaterConstants.URL)
                if (url != null) {
                    openStore(url)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "URL argument is missing or invalid", null)
                }
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun getAppVersion(): String {
        return try {
            val pInfo: PackageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
            pInfo.versionName
        } catch (e: PackageManager.NameNotFoundException) {
            "$e"
        }
    }

    private fun openStore(url: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        context.startActivity(intent)
    }
}
