import 'package:flutter/material.dart';

class WarehouseSelectionScreen extends StatefulWidget {
  const WarehouseSelectionScreen({super.key});

  @override
  _WarehouseSelectionScreenState createState() => _WarehouseSelectionScreenState();
}

class _WarehouseSelectionScreenState extends State<WarehouseSelectionScreen> {
  String? selectedWarehouse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF), // Set AppBar background to white
        centerTitle: true, // Center the title
        title: const Column(
          mainAxisSize: MainAxisSize.min, // Make the column only take as much space as it needs
          children: [
            Text(
              'Org ID: Stel1201',
              style: TextStyle(
                color: Colors.black, // Set the text color to black
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'User ID: U101',
              style: TextStyle(
                color: Colors.black, // Set the text color to black
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black), // Settings icon color set to black
            onPressed: () {
              Navigator.pushNamed(context, '/profile_and_settings');
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF3C3D37), // Background color changed to 3c3d37
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Icon(Icons.warehouse, size: 250, color: Colors.white), // Large warehouse icon
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)), // Rounded top corners for the container
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center-align text
                    children: [
                      const Text(
                        'Select a Warehouse',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Select a warehouse for stocktake',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedWarehouse,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Warehouse 1', child: Text('Warehouse 1')),
                          DropdownMenuItem(value: 'Warehouse 2', child: Text('Warehouse 2')),
                          DropdownMenuItem(value: 'Warehouse 3', child: Text('Warehouse 3')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedWarehouse = value;
                          });
                        },
                        hint: const Text('Select a Warehouse'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: selectedWarehouse == null ? null : () {
                          Navigator.pushNamed(context, '/stocktake');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50), // Button stretches full width
                          backgroundColor: const Color(0xFF3C3D37), // Button color changed to 3c3d37
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0), // Rounded corners for the button
                          ),
                        ),
                        child: const Text('Select Warehouse'),
                      ),
                    ],
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
