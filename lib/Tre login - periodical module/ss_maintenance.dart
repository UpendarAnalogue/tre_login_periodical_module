import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/maintenance_finished.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/p_inspection.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/pending_maintenece.dart';

class SsMaintenance extends StatefulWidget {
  const SsMaintenance({super.key});

  @override
  State<SsMaintenance> createState() => _SsMaintenanceState();
}

class _SsMaintenanceState extends State<SsMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: const Text('SS_MAINTENANCE', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // INSPECT SS
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PInspection()),
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context) => InspectSSScreen()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.settings, size: 40, color: Colors.blue),
                  SizedBox(height: 8),
                  Text("INSPECT SS", style: TextStyle(fontSize: 8)),
                ],
              ),
            ),

            // PENDING MAINTENANCE
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PendingMaintenece()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.build, size: 40, color: Colors.green),
                  SizedBox(height: 8),
                  Text("PENDING MAINTENANCE", style: TextStyle(fontSize: 8)),
                ],
              ),
            ),

            // MAINTENANCE FINISHED
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaintenanceFinished(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.report, size: 40, color: Colors.red),
                  SizedBox(height: 8),
                  Text("MAINTENANCE FINISHED", style: TextStyle(fontSize: 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
