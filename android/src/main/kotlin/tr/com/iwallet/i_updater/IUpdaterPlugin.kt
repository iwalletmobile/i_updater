package tr.com.iwallet.i_updater

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** IUpdaterPlugin */
class IUpdaterPlugin: FlutterPlugin, MethodCallHandler {
private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "i_updater")
    channel.setMethodCallHandler(this)
     context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
      "getAppVersion" -> result.success(getAppVersion())
      "appId" -> result.success(context.packageName)
      "openStore" -> {
        val url = call.argument<String>("url")
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
      val pInfo = context.packageManager.getPackageInfo(context.packageName, 0)
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
