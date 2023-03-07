package cn.lieyuntong.location_aar

import android.app.Application
import android.content.Context
import androidx.annotation.NonNull
import com.hdgq.locationlib.LocationOpenApi
import com.hdgq.locationlib.entity.ShippingNoteInfo
import com.hdgq.locationlib.listener.OnResultListener
import com.hdgq.locationlib.listener.OnSendResultListener

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** LocationAarPlugin */
class LocationAarPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var application: Application
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "location_aar")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        application = flutterPluginBinding.applicationContext as Application
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "init") {
            LocationOpenApi.init(application)
            result.success("司机sdk初始化成功")
        } else if (call.method == "auth") {
            val appId = call.argument<String>("appId")
            val appSecret = call.argument<String>("appSecret")
            val enterpriseSenderCode = call.argument<String>("enterpriseSenderCode")
            val environment = call.argument<String>("environment")
            val onResultListener = object : OnResultListener {
                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    result.error(errorCode!!, errorMsg, null)
                }
            }
            LocationOpenApi.auth(
                context,
                appId,
                appSecret,
                enterpriseSenderCode,
                environment,
                onResultListener
            )
        } else if (call.method == "start") {
            val vehicleNumber = call.argument<String>("vehicleNumber")
            val driverName = call.argument<String>("driverName")
            val remark = call.argument<String>("remark")
            val shippingNoteInfos = call.argument<Array<ShippingNoteInfo>>("shippingNoteInfos")
            val onResultListener = object : OnResultListener {
                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    result.error(errorCode!!, errorMsg, null)
                }
            }
            LocationOpenApi.start(
                context,
                vehicleNumber,
                driverName,
                remark,
                shippingNoteInfos,
                onResultListener
            );
        } else if (call.method == "send") {
            val vehicleNumber = call.argument<String>("vehicleNumber")
            val driverName = call.argument<String>("driverName")
            val remark = call.argument<String>("remark")
            val shippingNoteInfos = call.argument<Array<ShippingNoteInfo>>("shippingNoteInfos")
            val onResultListener = object : OnSendResultListener {
                override fun onFailure(
                    errorCode: String?,
                    errorMsg: String?,
                    shippingNoteInfos: MutableList<ShippingNoteInfo>?
                ) {
                   result.error(errorCode!!, errorMsg, shippingNoteInfos)
                }

                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

            }
            LocationOpenApi.send(
                context,
                vehicleNumber,
                driverName,
                remark,
                shippingNoteInfos,
                onResultListener
            );
        } else if (call.method == "pause") {
            val vehicleNumber = call.argument<String>("vehicleNumber")
            val driverName = call.argument<String>("driverName")
            val remark = call.argument<String>("remark")
            val shippingNoteInfos = call.argument<Array<ShippingNoteInfo>>("shippingNoteInfos")
            val onResultListener = object : OnResultListener {
                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    result.error(errorCode!!, errorMsg, null)
                }
            }
            LocationOpenApi.pause(
                context,
                vehicleNumber,
                driverName,
                remark,
                shippingNoteInfos,
                onResultListener
            );
        } else if (call.method == "restart") {
            val vehicleNumber = call.argument<String>("vehicleNumber")
            val driverName = call.argument<String>("driverName")
            val remark = call.argument<String>("remark")
            val shippingNoteInfos = call.argument<Array<ShippingNoteInfo>>("shippingNoteInfos")
            val onResultListener = object : OnResultListener {
                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    result.error(errorCode!!, errorMsg, null)
                }
            }
            LocationOpenApi.restart(
                context,
                vehicleNumber,
                driverName,
                remark,
                shippingNoteInfos,
                onResultListener
            )
        } else if (call.method == "stop") {
            val vehicleNumber = call.argument<String>("vehicleNumber")
            val driverName = call.argument<String>("driverName")
            val remark = call.argument<String>("remark")
            val shippingNoteInfos = call.argument<Array<ShippingNoteInfo>>("shippingNoteInfos")
            val onResultListener = object : OnResultListener {
                override fun onSuccess(shippingNoteInfos: MutableList<ShippingNoteInfo>?) {
                    result.success(shippingNoteInfos)
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    result.error(errorCode!!, errorMsg, null)
                }
            }
            LocationOpenApi.stop(
                context,
                vehicleNumber,
                driverName,
                remark,
                shippingNoteInfos,
                onResultListener
            )
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
