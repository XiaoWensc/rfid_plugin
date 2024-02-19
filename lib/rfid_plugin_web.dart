// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rfid_plugin/UHFTAGInfo.dart';

import 'rfid_plugin_platform_interface.dart';

/// A web implementation of the RfidPluginPlatform of the RfidPlugin plugin.
class RfidPluginWeb extends RfidPluginPlatform {
  /// Constructs a RfidPluginWeb
  RfidPluginWeb();

  static void registerWith(Registrar registrar) {
    RfidPluginPlatform.instance = RfidPluginWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

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
  Future<String> readData(
      {required String accessPwd,
      required String bank,
      required int ptr,
      required int cnt,
      required String uii}) {
    // TODO: implement readData
    throw UnimplementedError();
  }

  @override
  Future<UHFTAGInfo> readTagFromBuffer() {
    // TODO: implement readTagFromBuffer
    throw UnimplementedError();
  }

  @override
  Future<bool> startInventoryTag(
      {required int flagAnti, required int initQ, required int tidLen}) {
    // TODO: implement startInventoryTag
    throw UnimplementedError();
  }

  @override
  Future<bool> stopInventory() {
    // TODO: implement stopInventory
    throw UnimplementedError();
  }
}
