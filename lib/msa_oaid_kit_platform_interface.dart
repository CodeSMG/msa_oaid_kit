import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'msa_oaid_kit_method_channel.dart';

abstract class MsaOaidKitPlatform extends PlatformInterface {
  /// Constructs a MsaOaidKitPlatform.
  MsaOaidKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static MsaOaidKitPlatform _instance = MethodChannelMsaOaidKit();

  /// The default instance of [MsaOaidKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelMsaOaidKit].
  static MsaOaidKitPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MsaOaidKitPlatform] when
  /// they register themselves.
  static set instance(MsaOaidKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getOaid() {
    throw UnimplementedError('getOaid() has not been implemented.');
  }
}
