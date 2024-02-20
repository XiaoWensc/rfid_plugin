import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rfid_plugin/UHFTAGInfo.dart';

import 'rfid_plugin_method_channel.dart';

abstract class RfidPluginPlatform extends PlatformInterface {
  /// Constructs a RfidPluginPlatform.
  RfidPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static RfidPluginPlatform _instance = MethodChannelRfidPlugin();

  /// The default instance of [RfidPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelRfidPlugin].
  static RfidPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RfidPluginPlatform] when
  /// they register themselves.
  static set instance(RfidPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> init();
  Future<bool> free();
  Future<String?> readData({
    required String accessPwd,
    required String bank,
    required int ptr,
    required int cnt,
    required String uii,
  });
  Future<UHFTAGInfo?> readTagFromBuffer();
  Future<bool> startInventoryTag();
  Future<bool> stopInventory();
}
