import 'package:flutter/material.dart';

class StocktakeScreen extends StatelessWidget {
  const StocktakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C3D37), // Set the background color of AppBar to match the page
        centerTitle: true, // Center-align the title
        title: const Text(
          'WH ID: W101',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 22, // Font size for WH ID
            color: Colors.white, // Set the font color to white
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
      body: Container(
        color: const Color(0xFF3c3d37), // Background color for the whole page
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/warehouse_image.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white, // Set the card color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Card radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.qr_code, color: Colors.white),
                        label: const Text('Start Stocktake', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/stocktake_form');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3c3d37), // Button background color
                          foregroundColor: Colors.white, // Text and icon color
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0), // Button radius
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.list, color: Colors.white),
                        label: const Text('View Stocktake', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/view_stocktake'); // Navigate to ViewByBinIDScreen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3c3d37), // Same background color as Start Stocktake
                          foregroundColor: Colors.white, // Text and icon color
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0), // Button radius
                          ),
                        ),
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
