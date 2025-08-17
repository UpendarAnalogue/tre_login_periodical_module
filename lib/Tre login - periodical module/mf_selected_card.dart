import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/viewworkdetails.dart';


class MfSelectedCard extends StatelessWidget {
  final Map<String, String> data;
  const MfSelectedCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["name"] ?? "No Name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "ID: ${data["id"] ?? ""}",
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Colors.grey[300], // silver-grey
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PTR-1",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text("CAP : 8.0MVA", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("MAKE: KK RAO", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("SLNO:PT-4955", style: const TextStyle(fontSize: 16)),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // ✅ Green background
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // rounded corners
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Viewworkdetails(data: null,),
                        ),
                      );
                    // your action
                  },
                  child: const Text(
                    "FINISHED",
                    style: TextStyle(
                      color: Colors.white, // ✅ White text
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
