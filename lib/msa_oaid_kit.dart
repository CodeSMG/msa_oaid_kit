
import 'msa_oaid_kit_platform_interface.dart';

class MsaOaidKit {
  Future<String?> getPlatformVersion() {
    return MsaOaidKitPlatform.instance.getPlatformVersion();
  }
  Future<String?> getOaid() {
    return MsaOaidKitPlatform.instance.getOaid();
  }
}
