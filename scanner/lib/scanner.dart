import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String msg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        msg = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              allowDuplicates: false,
              onDetect: (barcode, args) async {
                if (barcode.rawValue != null && barcode.rawValue!.isNotEmpty)
                  await _insetDB(context, barcode.rawValue!);
              },
            ),
          ),
          Container(
            height: 80,
            color: msg == ''
                ? Colors.white
                : msg == 'Success'
                    ? Colors.green
                    : Colors.red,
          )
        ],
      ),
    );
  }

  Future _insetDB(BuildContext context, String winner) async {
    String textRes = '';
    final res = await FirebaseFirestore.instance.collection('results').get();
    final docs = res.docs;
    bool exist = false;
    docs.forEach((element) {
      if (element.data()['winner'] == winner) exist = true;
    });
    if (!exist) {
      msg = 'Success';
      await FirebaseFirestore.instance
          .collection('results')
          .add({'winner': winner, 'result_no': '${docs.length + 1}', 'created_at': FieldValue.serverTimestamp()});
    } else {
      msg = 'Duplicate';
    }
    setState(() {});
  }
}
