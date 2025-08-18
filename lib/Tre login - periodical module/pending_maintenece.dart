import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/ss_maintenance.dart';

class PendingMaintenece extends StatefulWidget {
  const PendingMaintenece({super.key});

  @override
  State<PendingMaintenece> createState() => _PendingMainteneceState();
}

class _PendingMainteneceState extends State<PendingMaintenece> {


//   void _showCustomDialog(BuildContext context, String msg, bool success) {
//   showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(0), // rectangle shape
//       ),
//       backgroundColor: Colors.white,
//       titlePadding: EdgeInsets.zero, // remove default padding
//       title: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(12),
//         color: success ? Colors.green : Colors.red, // ✅ dynamic color
//         child: Text(
//           success ? "Success" : "Failure", // ✅ dynamic title text
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       content: Text(
//         msg,
//         style: TextStyle(
//           color: success ? Colors.green[900] : Colors.red[900],
//           fontSize: 16,
//         ),
//         textAlign: TextAlign.center,
//       ),
//       actionsPadding: const EdgeInsets.only(
//         left: 12,
//         right: 12,
//         bottom: 12,
//       ),
//       actions: [
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: success ? Colors.green : Colors.red, // ✅ dynamic button color
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//             onPressed: () => Navigator.of(ctx).pop(),
//             child: const Text("OK"),
//           ),
//         ),
//       ],
//     ),
//   );
// }

  
  

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
