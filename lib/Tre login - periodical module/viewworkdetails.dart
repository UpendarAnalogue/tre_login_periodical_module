import 'package:flutter/material.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/ss_maintenance.dart';

class Viewworkdetails extends StatefulWidget {
  const Viewworkdetails({
    super.key,
    required data,
  });  

  @override
  State<Viewworkdetails> createState() => _ViewworkdetailsState();
}

// Reusable function that returns a Widget
Widget workDetailRow({required String title, required String value}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
      const Divider(thickness: 1),
    ],
  );
}

class _ViewworkdetailsState extends State<Viewworkdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SsMaintenance()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 16, 156, 188),
        title: const Text('View Work Details', style: TextStyle(fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [
            Column(
              children: [
                workDetailRow(title: "DOCKET NO", value: "TRE25072410266"),
                workDetailRow(title: "PTR NO", value: "1"),
        
                  Center(
                  child: Container(
                    color: Colors.grey[300],
                    width: double.infinity,  
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),  
                    child: Center(
                      child: const Text(
                        "PTR DETAILS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,  
                        ),
                      ),
                    ),
                  ),
                ),
        
                workDetailRow(title: "PTR DETAILS", value: "PTR DETAILS"),
                workDetailRow(title: "PTR CAPACITY", value: "8.0"),
                workDetailRow(title: "PTR MAKE", value: "KK RAO"),
                workDetailRow(title: "PTR SLNO", value: "PT-4955"),
                workDetailRow(title: "MFG YEAR", value: "NULL"),
                workDetailRow(title: "MAINT ID", value: "80380"),
                workDetailRow(title: "INSP EMP ID", value: "11111"),
        
                workDetailRow(title: "INSP EMP NAME", value: "P SAI SHESHU"),
                workDetailRow(title: "INSP EMP DES", value: "ADE"),
                workDetailRow(title: "MAINT DATE", value: "24/JUL/2025 17:25"),
                workDetailRow(title: "TRE SUBDIVISION ID", value: "402"),
                workDetailRow(title: "SS CODE", value: "0004-33KV SS-REC"),
                workDetailRow(title: "SS NAME", value: "0004-33KV SS-REC"),
                workDetailRow(title: "STATUS", value: "FINISHED"),
                workDetailRow(title: "NO OF TAPS", value: "NULL"),
        
                Center(
                  child: Container(
                    color: Colors.grey[300],
                    width: double.infinity, 
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ), // optional padding
                    child: Center(
                      child: const Text(
                        "PTR IR VALUES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, 
                        ),
                      ),
                    ),
                  ),
                ),
        
                workDetailRow(title: "HV TO BODY(MΩ)", value: "1"),
                workDetailRow(title: "LV TO BODY (MΩ)", value: "1"),
                workDetailRow(title: "HV TO LV(MΩ)", value: "1"),
                workDetailRow(title: "OLTI STATUS", value: "NOT TESTED"),
                workDetailRow(title: "OLTI REMARKS", value: "NULL"),
                workDetailRow(title: "WITI STATUS", value: "NOT TESTED"),
                workDetailRow(title: "WITI REMARKS", value: "NULL"),
                workDetailRow(title: "MOG STATUS", value: "NOT TESTED"),
                workDetailRow(title: "MOG REMARKS", value: "NULL"),
                workDetailRow(
                  title: "BUCHHOLZ RELAY STATUS",
                  value: "TESTED AND OK",
                ),
                workDetailRow(title: "BUCHHOLZ RELAY REMARKS", value: "NULL"),
                workDetailRow(
                  title: "BUCHHOLZ TRIP CIRCUIT STATUS",
                  value: "TESTED AND OK",
                ),
                workDetailRow(title: "BUCHHOLZ TRIP CKT REMARKS", value: "NULL"),
                workDetailRow(
                  title: "VENT PIPE DIAPHRAGM STATUS",
                  value: "TESTED AND OK",
                ),
                workDetailRow(
                  title: "VENT PIPE DIAPHRAGM REMARKS",
                  value: "NULL",
                ),
                workDetailRow(
                  title: "PRESSURE RELIEF VALVE STATUS",
                  value: "TESTED AND OK",
                ),
                workDetailRow(
                  title: "PRESSURE RELIEF VALVE REMARKS",
                  value: "NULL",
                ),
        
                workDetailRow(title: "BIMETALLIC CLAMPS", value: "AVAILABLE"),
                workDetailRow(title: "BUSH RODS STATUS", value: "REPAIRED"),
                workDetailRow(title: "OLTC MECHANISM STATUS", value: "NOT TESTED"),
                workDetailRow(title: "OLTC MECHANISM REMARKS", value: "NULL"),
                workDetailRow(title: "EARTH RESISTANCE(Ω)", value: "NULL"),
                workDetailRow(title: "FLEXIBLE JUMPERS", value: "AVAILABLE"),
                workDetailRow(title: "EARTHING STATUS", value: "DOUBLE FLAT EARTHING"),
                workDetailRow(title: "EARTH MAT STATUS", value: "RENOVATION REQUIRED"),
                workDetailRow(title: "BODY CURRENT", value: "1"),
                workDetailRow(title: "HORNGAP FUSE STATUS", value: "OK"),
                workDetailRow(title: "HORNGAP FUSE REMARKS", value: "NULL"),
                workDetailRow(title: "OIL LEAKAGE ARRESTED", value: "YES"),
                workDetailRow(title: "CLEANING OF BUSHES STATUS", value: "YES"),
                workDetailRow(title: "OIL BDV (KV) (PTR BOTTOM)", value: "1"),
                workDetailRow(title: "OIL BDV(KV) (PTR TOP)", value: "1"),
                workDetailRow(title: "OIL BDV (KV) OLTC", value: "1"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
