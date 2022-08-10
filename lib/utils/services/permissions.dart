import 'package:permission_handler/permission_handler.dart';

class AppPermission {
  static Future<void> getStorageRequest() async {
    await Permission.storage.request();
  }
}
