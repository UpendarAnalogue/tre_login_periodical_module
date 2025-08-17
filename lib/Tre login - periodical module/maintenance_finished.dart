import 'package:flutter/material.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SsMaintenance()),
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

              // 🔹 One container with all items separated by Divider
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
             
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,  
                  children: List.generate(finishedList.length * 2 - 1, (index) {
                    if (index.isOdd) {
                      // Divider after every item except last
                      return const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 20,
                      );
                    }
                    final itemIndex = index ~/ 2; // Actual item index
                    final item = finishedList[itemIndex];

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),

                      child: InkWell(
                        onTap: () {
     print("Tapped on ${item["id"]}");
     // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(item: item)));
  },
                        child: Container(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // ✅ force start alignment
                            children: [
                              Text(
                                item["id"]!,
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["name"]!,
                                style: const TextStyle(fontSize: 14),
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
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
