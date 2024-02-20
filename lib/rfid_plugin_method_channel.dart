import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rfid_plugin/UHFTAGInfo.dart';

import 'rfid_plugin_platform_interface.dart';

/// An implementation of [RfidPluginPlatform] that uses method channels.
class MethodChannelRfidPlugin extends RfidPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rfid_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> free() async {
    bool? state = await methodChannel.invokeMethod<bool>('free');
    return state ?? false;
  }

  @override
  Future<bool> init() async {
    bool? state = await methodChannel.invokeMethod<bool>('init');
    return state ?? false;
  }

  @override
  Future<String?> readData(
      {required String accessPwd,
      required String bank,
      required int ptr,
      required int cnt,
      required String uii}) {
    return methodChannel.invokeMethod<String>(
      "readData",
      {
        "accessPwd": accessPwd,
        "bank": bank,
        "ptr": ptr,
        "cnt": cnt,
        "uii": uii,
      },
    );
  }

  @override
  Future<UHFTAGInfo?> readTagFromBuffer() async {
    Map<String, dynamic>? json =
        await methodChannel.invokeMapMethod<String, dynamic>('readTag');
    if (json == null) {
      return null;
    }
    final UHFTAGInfo tags = UHFTAGInfo.fromJson(json);
    return tags;
  }

  @override
  Future<bool> startInventoryTag() async {
    bool? state = await methodChannel.invokeMethod<bool>('startInventoryTag');
    return state ?? false;
  }

  @override
  Future<bool> stopInventory() async {
    bool? state = await methodChannel.invokeMethod<bool>('stopInventory');
    return state ?? false;
  }
}
