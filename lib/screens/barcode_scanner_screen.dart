import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends StatelessWidget {
  final Function(String) onScan;

  const BarcodeScannerScreen({super.key, required this.onScan, required Null Function(String barcode) onBarcodeScanned});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
        backgroundColor: Colors.green,
      ),
      body: MobileScanner(
        onDetect: (BarcodeCapture barcodeCapture) {
          final barcode = barcodeCapture.barcodes.first; // Get the first detected barcode
          if (barcode.rawValue != null) {
            final String code = barcode.rawValue!;
            onScan(code); // Pass the scanned code back
            Navigator.pop(context); // Close the scanner after scanning
          }
        },
      ),
    );
  }
}
