import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ObdService {
  BluetoothConnection? connection;

  bool get isConnected => connection != null;

  Future<bool> connect() async {
    try {
      final devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();

      if (devices.isEmpty) {
        return false;
      }

      final device = devices.first;

      connection = await BluetoothConnection.toAddress(
        device.address,
      );

      return connection != null;
    } catch (_) {
      connection = null;
      return false;
    }
  }

  Future<String> scan() async {
    if (connection == null) {
      return 'لا يوجد اتصال فعلي بالمحول';
    }

    try {
      connection!.output.add(
        List<int>.from(
          '0100\r'.codeUnits,
        ),
      );

      await connection!.output.allSent;

      await Future.delayed(
        const Duration(milliseconds: 1000),
      );

      return 'تم إرسال طلب OBD إلى المحول. انتظار بيانات ECU.';
    } catch (_) {
      return 'حدث خطأ أثناء الاتصال بالمحول';
    }
  }

  void dispose() {
    connection?.finish();
    connection = null;
  }
}
