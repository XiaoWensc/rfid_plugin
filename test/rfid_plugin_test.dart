import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rfid_plugin/UHFTAGInfo.dart';
import 'package:rfid_plugin/rfid_plugin.dart';
import 'package:rfid_plugin/rfid_plugin_method_channel.dart';
import 'package:rfid_plugin/rfid_plugin_platform_interface.dart';

class MockRfidPluginPlatform
    with MockPlatformInterfaceMixin
    implements RfidPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> free() {
    // TODO: implement free
    throw UnimplementedError();
  }

  @override
  Future<bool> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<String?> readData(
      {required String accessPwd,
      required String bank,
      required int ptr,
      required int cnt,
      required String uii}) {
    // TODO: implement readData
    throw UnimplementedError();
  }

  @override
  Future<UHFTAGInfo?> readTagFromBuffer() {
    // TODO: implement readTagFromBuffer
    throw UnimplementedError();
  }

  @override
  Future<bool> startInventoryTag() {
    // TODO: implement startInventoryTag
    throw UnimplementedError();
  }

  @override
  Future<bool> stopInventory() {
    // TODO: implement stopInventory
    throw UnimplementedError();
  }
}

void main() {
  final RfidPluginPlatform initialPlatform = RfidPluginPlatform.instance;

  test('$MethodChannelRfidPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRfidPlugin>());
  });

  test('getPlatformVersion', () async {
    RfidPlugin rfidPlugin = RfidPlugin();
    MockRfidPluginPlatform fakePlatform = MockRfidPluginPlatform();
    RfidPluginPlatform.instance = fakePlatform;

    expect(await rfidPlugin.getPlatformVersion(), '42');
  });
}
