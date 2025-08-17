import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/ss_maintenance.dart';

class PendingMaintenece extends StatefulWidget {
  const PendingMaintenece({super.key});

  @override
  State<PendingMaintenece> createState() => _PendingMainteneceState();
}

class _PendingMainteneceState extends State<PendingMaintenece> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SsMaintenance(), // Replace with your target screen
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Pending Maintenance', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Search Icon (grey color)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {
                // Search action
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Search clicked")));
              },
            ),

            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search pending maintenance...",
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
