import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'msa_oaid_kit_platform_interface.dart';

/// An implementation of [MsaOaidKitPlatform] that uses method channels.
class MethodChannelMsaOaidKit extends MsaOaidKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('msa_oaid_kit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getOaid() async{
    final oaid = await methodChannel.invokeMethod<String>('getOaid');
    return oaid;
  }
}
