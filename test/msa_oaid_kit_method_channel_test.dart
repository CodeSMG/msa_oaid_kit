import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:msa_oaid_kit/msa_oaid_kit_method_channel.dart';

void main() {
  MethodChannelMsaOaidKit platform = MethodChannelMsaOaidKit();
  const MethodChannel channel = MethodChannel('msa_oaid_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
