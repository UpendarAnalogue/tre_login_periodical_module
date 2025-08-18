import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:tre_login_periodical_module/Tre%20login%20-%20periodical%20module/ss_maintenance.dart';

class PInspection extends StatefulWidget {
  const PInspection({super.key});

  @override
  State<PInspection> createState() => _PInspectionState();
}

class _PInspectionState extends State<PInspection> {
  String? selectedDivision;
  String? selectedSubDivision;
  String? selectedSection;
  DateTime? selectedDate;
  String? selectedSS;
  String? selectedSapEquipCode;

  String? selectedOti;
  String? selectedWti;
  String? selectedMog;
  String? selectedBuchholz;
  String? selectedVent;
  String? selectedPressure;
  String? selectedBimetalic;
  String? selectedBush;
  String? selectedOltc;
  String? selectedFlexible;
  String? selectedEarthing;
  String? selectedEarthMatStatus;
  String? selectedHorngap;
  String? selectedOilLeakage;
  String? selectedCleaning;
  //String?  ;

  final TextEditingController _nooftaps = TextEditingController();
  final TextEditingController _irhvbody = TextEditingController();
  final TextEditingController _irlvbody = TextEditingController();
  final TextEditingController _irhvlv = TextEditingController();
  final TextEditingController _earthresistance = TextEditingController();
  final TextEditingController _ptrbody = TextEditingController();
  final TextEditingController _oilbdvvaluebottom = TextEditingController();
  final TextEditingController _oilbdvvaluetop = TextEditingController();
  final TextEditingController _oilbdvvalueloltc = TextEditingController();
  final TextEditingController _oticontroller = TextEditingController();
  final TextEditingController _wticontroller = TextEditingController();
  final TextEditingController _mogcontroller = TextEditingController();
  final TextEditingController _buchholzcontroller = TextEditingController();
  final TextEditingController _ventcontroller = TextEditingController();
  final TextEditingController _pressurecontroller = TextEditingController();
  final TextEditingController _bushrodcontroller = TextEditingController();
  final TextEditingController _oltcmechcontroller = TextEditingController();
  // final TextEditingController _ = TextEditingController();
  // final TextEditingController _ = TextEditingController();

  List<String> selectSS = ["0004-33KV SS-REC"];

  final Map<String, List<String>> optionValues = {
    "320000098": ["8.0MVA", "ACCURATE", "APNPDCL-07", "2010"],
    "3000000215": ["8.0MVA", "VE", "119699", "1991"],
    "310000111": ["8.0MVA", "KK RAO", "PT-4955", "null"],
  };
  List<String> displayedValues = ["-", "-", "-", "-"];

  List<String> selectDivision = [
    "SELECT",
    "HANAMKONDA TOWN",
    "HANAMKONDA RURAL",
  ];
  List<String> selectSubDivision = [
    "SELECT",
    "KAZIPET",
    "HANAMKONDA",
    "NAYEEMANAGAR",
  ];
  List<String> selectSection = [
    "SELECT",
    "NIT",
    "MADIKONDA",
    "KAZIPET",
    "KADIPIKONDA",
    "WADDEPALLY",
  ];

  List<String> selectOtiStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectWtiStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectMogStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectBuchholzStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectVentStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectPressureStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectBimetallicStatus = [
    "SELECT",
    "AVAILABLE",
    "NOT AVAILABLE",
  ];
  List<String> selectBushStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectOltcStatus = [
    "SELECT",
    "TESTED AND OK",
    "NOT TESTED",
    "REPAIRED",
    "REPLACED",
    "TOBE ATTENDED",
    "UN SERVICEABLE",
  ];

  List<String> selectFlexible = ["SELECT", "AVAILABLE", "NOT AVAILABLE"];

  List<String> selectEarthing = [
    "SELECT",
    "DOUBLE FLAT EARTHING",
    "SINGLE FLAT EARTHING",
  ];

  List<String> selectEarthMatStatus = [
    "SELECT",
    "RENOVATION REQUIRED",
    "RENOVATION NOT REQUIRED",
  ];

  List<String> selectHorngapFuseStatus = ["SELECT", "OK", "NOT OK"];

  List<String> selectOilLeakageStatus = ["SELECT", "YES", "NO"];

  List<String> selectCleaningStatus = ["SELECT", "YES", "NO"];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,  
        backgroundColor: Colors.transparent, 
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Center(
           child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              msg,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,  
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkField(BuildContext context) {
    if (selectedDivision == null) {
      _showSnackBar(context, "Please Select your Division !");
    } else if (selectedSubDivision == null || selectedSubDivision!.isEmpty) {
      _showSnackBar(context, "Please Select your Sub Division !");
    } else if (selectedSection == null || selectedSection!.isEmpty) {
      _showSnackBar(context, "Please Select your Section !");
    } else if (selectedDate == null) {
      _showSnackBar(context, "Please Select Date of Inspection");
    } else if (selectedSS == null || selectedSection!.isEmpty) {
      _showSnackBar(context, "Please Select SS");
    } else if (selectedSapEquipCode == null) {
      _showSnackBar(context, "Please Select SAP EQUIPMENT CODE");
    } else if (_nooftaps.text.isEmpty) {
      _showSnackBar(context, "Please Enter NO OF TAPS");
    } else if (_irhvbody.text.isEmpty) {
      _showSnackBar(context, "Please Enter IR HV_BODY (MΩ)");
    } else if (_irlvbody.text.isEmpty) {
      _showSnackBar(context, "Please Enter IR LV-BODY(MΩ)");
    } else if (_irhvlv.text.isEmpty) {
      _showSnackBar(context, "Please Enter IR HV-LV(MΩ)");
    } else if (selectedOti == null) {
      _showSnackBar(context, "Please select OTI STATUS");
    } else if ((selectedOti == "TOBE ATTENDED" ||
            selectedOti == "UN SERVICEABLE") &&
        _oticontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedOti");
    } else if (selectedWti == null) {
      _showSnackBar(context, "Please Select WTI STATUS");
    } else if ((selectedWti == "TOBE ATTENDED" ||
            selectedWti == "UN SERVICEABLE") &&
        _wticontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedWti");
    } else if (selectedMog == null) {
      _showSnackBar(context, "Please Select MOG STATUS");
    } else if ((selectedMog == "TOBE ATTENDED" ||
            selectedMog == "UN SERVICEABLE") &&
        _mogcontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedMog");
    } else if (selectedBuchholz == null) {
      _showSnackBar(
        context,
        "Please SELECT Buhholz & Surge relay trip circuit connections",
      );
    } else if ((selectedBuchholz == "TOBE ATTENDED" ||
            selectedBuchholz == "UN SERVICEABLE") &&
        _buchholzcontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedBuchholz");
    } else if (selectedVent == null) {
      _showSnackBar(context, "Please SELECT VENT PIPE DIAPHRAGM STATUS");
    } else if ((selectedVent == "TOBE ATTENDED" ||
            selectedVent == "UN SERVICEABLE") &&
        _ventcontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedVent");
    } else if (selectedPressure == null) {
      _showSnackBar(context, 'Please SELECT Pressure relief value status');
    } else if ((selectedPressure == "TOBE ATTENDED" ||
            selectedPressure == "UN SERVICEABLE") &&
        _pressurecontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedPressure");
    } else if (selectedBimetalic == null) {
      _showSnackBar(context, "Please Select Bimetallic Clamps Status");
    } else if (selectedBush == null) {
      _showSnackBar(context, "Please Select Bush Rods Status");
    } else if ((selectedBush == "TOBE ATTENDED" ||
            selectedBush == "UN SERVICEABLE") &&
        _bushrodcontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedBush");
    } else if (selectedOltc == null) {
      _showSnackBar(context, "Please Select OLTC Mechanism Status");
    } else if ((selectedOltc == "TOBE ATTENDED" ||
            selectedOltc == "UN SERVICEABLE") &&
        _oltcmechcontroller.text.isEmpty) {
      _showSnackBar(context, "Please Enter for $selectedOltc");
    } else if (_earthresistance.text.trim().isEmpty) {
      _showSnackBar(context, "Please Enter Earth Resistance (Ω)");
    } else if (selectedFlexible == null) {
      _showSnackBar(context, "Please Select Flexible Jumpers");
    } else if (selectedEarthing == null) {
      _showSnackBar(context, "Please Slect Earthing Status");
    } else if (selectedEarthMatStatus == null) {
      _showSnackBar(context, "Please Select Earth Mat Status");
    } else if (_ptrbody.text.trim().isEmpty) {
      _showSnackBar(context, "Please Enter PTR Body current (Amps)");
    } else if (selectedHorngap == null) {
      _showSnackBar(context, "Please Select Horn Gap Fuse Status");
    } else if (selectedOilLeakage == null) {
      _showSnackBar(context, "Please Select Oil Leakage arrested status");
    } else if (selectedCleaning == null) {
      _showSnackBar(context, "Please Select Cleaning of bushes Status");
    } else if (_oilbdvvaluebottom.text.trim().isEmpty) {
      _showSnackBar(context, "Please Enter Oil BDV value PTR Bottom(KV)");
    } else if (_oilbdvvaluetop.text.trim().isEmpty) {
      _showSnackBar(context, "Please Enter Oil BDV value PTR TOP (KV)");
    } else if (_oilbdvvalueloltc.text.trim().isEmpty) {
      _showSnackBar(context, "Please Enter Oil BDV Value OLTEC(KV)");
    }
    //todo
    else {
      _showSuccessDialog(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), 
        ),
        backgroundColor: Colors.white,
        titlePadding: EdgeInsets.zero,  
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.green,  
          child: const Text(
            "Success",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: const Text(
          "All fields are filled successfully ",
          style: TextStyle(color: Colors.green, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        actionsPadding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, 
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("OK"),
            ),
          ),
        ],
      ),
    );
  }

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
            Text('P_INSPECTION', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),

          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "SECTION DETAILS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Division Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDivision = value;
                            selectedSubDivision = null;
                            //selectSubDivision[0]; // reset next
                            selectedSection = null; // reset third
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SUB-DIVISION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSubDivision,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSubDivision
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSubDivision = value;
                                  selectedSection = null;
                                  // selectedSection = selectSection[0];
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      // Status Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SECTION",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedSection,
                        decoration: InputDecoration(
                          hintText: "SELECT",
                          border: OutlineInputBorder(),
                          // labelText: 'Select Complaint 2',
                        ),
                        items: selectSection
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: selectedSubDivision == null
                            ? null
                            : (value) {
                                setState(() {
                                  selectedSection = value;
                                });
                              },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Date of Inspection",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : "TAP HERE",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              // second card
              Card(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        width: double.infinity,
                        child: Center(
                          child: const Text(
                            "PTR",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SELECT SS",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField2<String>(
                              value: selectedSS,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.red),
                                border: OutlineInputBorder(),
                              ),
                                                      hint: const Text("SELECT"),

                              items: selectSS
                                  .map(
                                    (status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(status),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSS = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 8),
                        ],
                      ),

                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: const Text(
                              "SAP EQUIPMENT CODE",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField2<String>(
                              value: selectedSapEquipCode,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 12,
                                ),
                              ),
                                                      hint: const Text("SELECT"),

                              items: ["320000098", "3000000215", "310000111"]
                                  .map(
                                    (code) => DropdownMenuItem(
                                      value: code,
                                      child: Text(code),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSapEquipCode = value;
                                  displayedValues =
                                      optionValues[value] ??
                                      ["-", "-", "-", "-"];
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              "PTR CAPACITY",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              displayedValues[0],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8B8B83),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              "PTR MAKE",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              displayedValues[1],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8B8B83),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              "PTR SLNO",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              displayedValues[2],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8B8B83),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            const Text(
                              "PTR YEAR OF MFG",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              displayedValues[3],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8B8B83),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "NO OF TAPS",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _nooftaps,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "IR HV-BODY(MΩ)",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ), // spacing between label and textfield
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _irhvbody,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "IR LV-BODY(MΩ)",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ), // spacing between label and textfield
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _irlvbody,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "IR HV-LV(MΩ)",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ), // spacing between label and textfield
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _irhvlv,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "OTI STATUS",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedOti,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                         hint: const Text("SELECT"),
                        items: selectOtiStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedOti = value;
                          });
                        },
                      ),
                      if (selectedOti == "TOBE ATTENDED" ||
                          selectedOti == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _oticontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "WTI STATUS",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedWti,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                         hint: const Text("SELECT"),
                        items: selectWtiStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedWti = value;
                          });
                        },
                      ),
                      if (selectedWti == "TOBE ATTENDED" ||
                          selectedWti == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _wticontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MOG STATUS",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedMog,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                         hint: const Text("SELECT"),
                        items: selectMogStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMog = value;
                          });
                        },
                      ),
                      if (selectedMog == "TOBE ATTENDED" ||
                          selectedMog == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _mogcontroller,

                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Buchholz & Surge relay trip circuit connections",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedBuchholz,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                         hint: const Text("SELECT"),
                        items: selectBuchholzStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBuchholz = value;
                          });
                        },
                      ),
                      if (selectBuchholzStatus == "TOBE ATTENDED" ||
                          selectBuchholzStatus == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _buchholzcontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Vent pipe diaphragm status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedVent,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                         hint: const Text("SELECT"),
                        items: selectVentStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedVent = value;
                          });
                        },
                      ),
                      if (selectedVent == "TOBE ATTENDED" ||
                          selectedVent == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _ventcontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pressure relief value status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedPressure,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
 
                        ),
                                                hint: const Text("SELECT"),

                        items: selectPressureStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPressure = value;
                          });
                        },
                      ),
                      if (selectedPressure == "TOBE ATTENDED" ||
                          selectedPressure == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _pressurecontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ), // normal state
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bimetallic clamps status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedBimetalic,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectBimetallicStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBimetalic = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bush rods status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedBush,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectBushStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBush = value;
                          });
                        },
                      ),
                      if (selectedBush == "TOBE ATTENDED" ||
                          selectedBush == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _bushrodcontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "OLTC Mechanism status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedOltc,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectOltcStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedOltc = value;
                          });
                        },
                      ),
                      if (selectedOltc == "TOBE ATTENDED" ||
                          selectedOltc == "UN SERVICEABLE") ...[
                        const SizedBox(height: 12),
                        TextField(
                          controller: _oltcmechcontroller,
                          decoration: const InputDecoration(
                            labelText: "Enter remarks....",
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "Earth Resistance (Ω)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _earthresistance,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Flexible Jumpers",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedFlexible,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectFlexible
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFlexible = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Earthing Status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedEarthing,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                        hint: const Text("SELECT"),
                        items: selectEarthing
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEarthing = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Earth mat status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Clean Dropdown (No border)
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedEarthMatStatus,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none, // removes border
                        ),
                        hint: const Text("SELECT"),
                        items: selectEarthMatStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEarthMatStatus = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "PTR Body current (Amps)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _ptrbody,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Horn gap fuse status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedHorngap,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectHorngapFuseStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedHorngap = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Oil leakage arrested status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedOilLeakage,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectOilLeakageStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedOilLeakage = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cleaning of bushes status",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        value: selectedCleaning,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                        hint: const Text("SELECT"),
                        items: selectCleaningStatus
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCleaning = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "Oil BDV Value PTR Bottom(KV)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _oilbdvvaluebottom,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),

                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "Oil BDV Value PTR TOP(KV)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _oilbdvvaluetop,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  "Oil BDV Value OLTC(KV)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _oilbdvvalueloltc,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                  // hintText: "Enter year",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _checkField(context);
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
