import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class StocktakePage extends StatefulWidget {
  const StocktakePage({super.key});

  @override
  _StocktakePageState createState() => _StocktakePageState();
}

class _StocktakePageState extends State<StocktakePage> {
  String binId = ''; // Variable to store scanned Bin ID
  final MobileScannerController cameraController = MobileScannerController();

  void scanBarcode(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Scan Barcode'),
          content: SizedBox(
            height: 300,
            child: MobileScanner(
              controller: cameraController,
              onDetect: (BarcodeCapture barcodeCapture) {
                if (barcodeCapture.barcodes.isNotEmpty) {
                  setState(() {
                    binId = barcodeCapture.barcodes.first.rawValue ?? '';
                  });
                  Navigator.of(context).pop(); // Close the dialog after scanning
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C3D37), // Dark gray background
      appBar: AppBar(
        backgroundColor: const Color(0x00ffe4c4), // Beige top bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back to the previous page
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'WH ID: W101',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23, // Font size for WH ID
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/profile_and_settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30), // Space between app bar and "View Stocktake"
              Container(
                width: double.infinity, // Stretch the banner full-width
                padding: const EdgeInsets.symmetric(vertical: 15), // Padding for the banner effect
                color: const Color(0xFFECDFCC), // Banner color for "View Stocktake"
                child: const Center(
                  child: Text(
                    "View Stocktake",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Font size for View Stocktake
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150), // Space between banner and Bin ID input
              // Bin ID Input Section
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Bin ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold, // Bold "Bin ID"
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 300, // Increased width of the input field
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7), // Radius of 7 for the text field
                      ),
                      child: TextField(
                        readOnly: true, // Make the TextField read-only
                        controller: TextEditingController(text: binId), // Set the controller to show scanned value
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.qr_code_scanner),
                            onPressed: () => scanBarcode(context), // Call scan function on press
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90), // Space between input field and confirm button
              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Bin ID details page on Confirm press
                    Navigator.pushNamed(context, '/view_by_binID');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFECDFCC), // Button background color
                    minimumSize: const Size(200, 50), // Increased size of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7), // Button border radius of 7
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.black, // Button text color
                      fontSize: 20, // Font size for the button text
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Extra spacing for the bottom of the screen
            ],
          ),
        ),
      ),
    );
  }
}
