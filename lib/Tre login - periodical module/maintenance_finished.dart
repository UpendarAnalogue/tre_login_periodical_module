import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/mf_selected_card.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/ss_maintenance.dart';

class MaintenanceFinished extends StatefulWidget {
  const MaintenanceFinished({super.key});

  @override
  State<StatefulWidget> createState() => _MaintenanceFinishedState();
}

class _MaintenanceFinishedState extends State<MaintenanceFinished> {
  // 🔹 Example dynamic data
  final List<Map<String, String>> finishedList = [
    {"id": "#TRE25072410266", "name": "0004-33KV SS-REC", "date": "17-08-2025"},
    {"id": "#TRE25072410267", "name": "0005-11KV SS-ABC", "date": "18-08-2025"},
    {"id": "#TRE25072410268", "name": "0006-33KV SS-XYZ", "date": "19-08-2025"},
    {"id": "#TRE25072410269", "name": "0007-11KV SS-DEF", "date": "20-08-2025"},
    {"id": "#TRE25072410270", "name": "0008-33KV SS-GHI", "date": "21-08-2025"},
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // 🔍 Filtered list based on search
    final filteredList = finishedList
        .where(
          (item) =>
              item["name"]!.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SsMaintenance()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: const Text(
          'Finished Maintenance',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Row
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Search clicked")),
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Find SS....",
                        hintStyle: TextStyle(fontSize: 12),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Finished list with dividers (filtered)
              if (filteredList.isEmpty)
                const Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(filteredList.length * 2 - 1, (index) {
                    if (index.isOdd) {
                      return const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 20,
                      );
                    }

                    final itemIndex = index ~/ 2;
                    final item = filteredList[itemIndex];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MfSelectedCard(data: item),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["id"]!,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["name"]!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Date: ${item["date"]}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

