import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // Import for barcode scanning

void main() {
  runApp(const MaterialApp(
    home: StocktakeFormScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class StocktakeFormScreen extends StatefulWidget {
  const StocktakeFormScreen({super.key});

  @override
  _StocktakeFormScreenState createState() => _StocktakeFormScreenState();
}

class _StocktakeFormScreenState extends State<StocktakeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {
    'Bin ID': TextEditingController(),
    'HU ID': TextEditingController(),
    'Product ID': TextEditingController(),
    'Batch ID': TextEditingController(),
    'Quantity': TextEditingController(),
  };

  void _showConfirmationBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFECDFCC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sure you want to continue?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _clearFormFields();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Yes'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _clearFormFields() {
    controllers.forEach((key, controller) {
      controller.clear();
    });
    setState(() {});
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showConfirmationBottomSheet();
    }
  }

  Future<void> _scanBarcode(String fieldName) async {
    // Show a full-screen barcode scanner
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BarcodeScannerScreen(
          onBarcodeScanned: (barcode) {
            setState(() {
              controllers[fieldName]!.text = barcode;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'WH ID: W101',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/profile_and_settings');
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3C3D37), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 100),
              _buildInputField(
                'Bin ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () {
                  _scanBarcode('Bin ID');
                },
              ),
              const SizedBox(height: 20),
              _buildInputField(
                'HU ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () {
                  _scanBarcode('HU ID');
                },
              ),
              const SizedBox(height: 20),
              _buildInputField(
                'Product ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () {
                  _scanBarcode('Product ID');
                },
              ),
              const SizedBox(height: 20),
              _buildInputField(
                'Batch ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () {
                  _scanBarcode('Batch ID');
                },
              ),
              const SizedBox(height: 20),
              _buildInputField('Quantity'),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'UoM',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Inter',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(value: 'KG', child: Text('eaches')),
                  DropdownMenuItem(value: 'L', child: Text('cartons')),
                  DropdownMenuItem(value: 'PCS', child: Text('crates')),
                ],
                onChanged: (value) {
                  // Handle UoM selection
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFFECDFCC),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {IconData? suffixIcon, VoidCallback? onSuffixIconPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controllers[label],
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Inter',
          ),
          border: const OutlineInputBorder(),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: Colors.black),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

class BarcodeScannerScreen extends StatelessWidget {
  final Function(String) onBarcodeScanned;

  const BarcodeScannerScreen({super.key, required this.onBarcodeScanned});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
        backgroundColor: Colors.black,
      ),
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          if (barcodes.isNotEmpty) {
            final String barcodeValue = barcodes.first.rawValue!;
            onBarcodeScanned(barcodeValue);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
