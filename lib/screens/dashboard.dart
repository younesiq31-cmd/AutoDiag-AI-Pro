import 'package:flutter/material.dart';
import '../services/obd/obd_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ObdService obd = ObdService();

  String status = 'غير متصل';
  String vehicleStatus = 'لم يتم فحص المركبة';
  bool scanning = false;

  Future<void> connectOBD() async {
    setState(() {
      status = 'جاري البحث عن محول OBD...';
    });

    final connected = await obd.connect();

    setState(() {
      status = connected
          ? 'تم الاتصال بالمحول'
          : 'لم يتم العثور على محول OBD';
    });
  }

  Future<void> scanVehicle() async {
    if (!obd.isConnected) {
      setState(() {
        vehicleStatus = 'يجب الاتصال بمحول OBD أولاً';
      });
      return;
    }

    setState(() {
      scanning = true;
      vehicleStatus = 'جاري قراءة بيانات المركبة...';
    });

    final result = await obd.scan();

    setState(() {
      scanning = false;
      vehicleStatus = result;
    });
  }

  @override
  void dispose() {
    obd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDiag AI Pro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      size: 70,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'تشخيص المركبة الذكي',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(status),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text(
                      'OBD',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: connectOBD,
                        icon: const Icon(Icons.bluetooth),
                        label: const Text(
                          'الاتصال بمحول OBD',
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: scanning ? null : scanVehicle,
                        icon: scanning
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.search),
                        label: const Text(
                          'بدء فحص المركبة',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'نتيجة الفحص',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(vehicleStatus),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'مصداقية التشخيص',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'لا يعرض التطبيق نتيجة تشخيص على أنها حقيقية '
                      'إلا بعد استقبال بيانات فعلية من وحدة المركبة.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
