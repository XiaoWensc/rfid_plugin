package com.example.rfid_plugin

import androidx.annotation.NonNull

import com.rscja.deviceapi.RFIDWithUHFUART
import com.rscja.deviceapi.entity.UHFTAGInfo
import com.rscja.deviceapi.exception.ConfigurationException
import com.rscja.deviceapi.interfaces.IUHF
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.util.Log

/** RfidPlugin */
class RfidPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  val INIT = "init"
  val FREE = "free"
  val READ_DATA = "readData"
  val READ_TAG = "readTag"
  val startInventoryTag = "startInventoryTag"
  val stopInventory = "stopInventory"
  val convertUiiToEPC = "convertUiiToEPC"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "rfid_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    Log.d("devin_zz", call.method)
    try {
      if (call.method == "getPlatformVersion") {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      } else if (call.method == INIT) {
        result.success(RFIDWithUHFUART.getInstance().init())
      } else if (call.method == READ_DATA) {
        val accessPwd = call.argument<String>("accessPwd") //标签的ACCESS PASSWORD（4 byte）
        val bank = call.argument<Int>("bank") ?: 0//标签的存储区
        val ptr = call.argument<Int>("ptr") ?: 0//起始地址的偏移量
        val cnt = call.argument<Int>("cnt") ?: 0//数据的长度（Word为单位，不能为0）

        val data  = RFIDWithUHFUART.getInstance().readData(accessPwd, bank, ptr, cnt)

        if (data == null) {
          Log.d("devin_zz", "读取失败")
          result.error("INIT_ERR", "读取失败", null)
        } else {
          Log.d("devin_zz", "读取成功")
          result.success(data)
        }
      } else if (call.method == FREE) {
        result.success(RFIDWithUHFUART.getInstance().free())
      } else if (call.method == READ_TAG) {
        val tags : UHFTAGInfo = RFIDWithUHFUART.getInstance().readTagFromBuffer()
        Log.d("devin_zz", READ_TAG)
        val map = HashMap<String, Any>()
        val epcBytes = ArrayList<Int>()
        tags.epcBytes.forEach {
          epcBytes.add(it.toInt())
        }
        map["epcBytes"] = epcBytes
        map["pc"] = tags.pc
        map["epc"] = tags.epc
        map["tid"] = tags.tid
        map["user"] = tags.user
        map["rssi"] = tags.rssi
        map["ant"] = tags.ant
        map["reserved"] = tags.reserved
        map["remain"] = tags.remain
        map["index"] = tags.index
        map["count"] = tags.count

        result.success(map)
      } else if (call.method == startInventoryTag) {
//        val flagAnti = call.argument<Int>("flagAnti") ?: 0 //是否使用防碰撞识别功能,默认使用0
//        val initQ = call.argument<Int>("initQ") ?: 1 //防碰撞识别过程的初始Q值，flagAnti为1时有效
//        // 新增
//        val tidLen = call.argument<Int>("tidLen") ?: 1 //TID的长度，单位为“字”
        val version = RFIDWithUHFUART.getInstance().getVersion()
        Log.d("devin_zz", "UHF模块版本号")
        Log.d("devin_zz", version)
        val data  = RFIDWithUHFUART.getInstance().startInventoryTag()
        result.success(data)
      } else if (call.method == stopInventory) {
        result.success(RFIDWithUHFUART.getInstance().stopInventory())
      } else if (call.method == convertUiiToEPC) {
        val uii = call.argument<String>("uii") ?: "1"//标签的UII
//        val data  = RFIDWithUHFUART.getInstance().convertUiiToEPC(uii)
//
//        if (data == null) {
//          Log.d("devin_zz", "读取失败")
//          result.error("INIT_ERR", "读取失败", null)
//        } else {
//          Log.d("devin_zz", "读取成功")
//          result.success(data)
//        }
      } else {
        result.notImplemented()
      }
    } catch (e: ConfigurationException) {
      e.printStackTrace()
      result.error("INIT_ERR", "初始化异常", e)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
