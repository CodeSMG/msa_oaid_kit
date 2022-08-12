import 'package:flutter_test/flutter_test.dart';
import 'package:msa_oaid_kit/msa_oaid_kit.dart';
import 'package:msa_oaid_kit/msa_oaid_kit_platform_interface.dart';
import 'package:msa_oaid_kit/msa_oaid_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMsaOaidKitPlatform
    with MockPlatformInterfaceMixin
    implements MsaOaidKitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getOaid() {
    throw UnimplementedError();
  }
}

void main() {
  final MsaOaidKitPlatform initialPlatform = MsaOaidKitPlatform.instance;

  test('$MethodChannelMsaOaidKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMsaOaidKit>());
  });

  test('getPlatformVersion', () async {
    MsaOaidKit msaOaidKitPlugin = MsaOaidKit();
    MockMsaOaidKitPlatform fakePlatform = MockMsaOaidKitPlatform();
    MsaOaidKitPlatform.instance = fakePlatform;
  
    expect(await msaOaidKitPlugin.getPlatformVersion(), '42');
  });
}
