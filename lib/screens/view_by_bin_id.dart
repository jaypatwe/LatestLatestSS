import 'package:flutter/material.dart';

class ViewByBinIDScreen extends StatefulWidget {
  const ViewByBinIDScreen({super.key});

  @override
  _ViewByBinIDScreenState createState() => _ViewByBinIDScreenState();
}

class _ViewByBinIDScreenState extends State<ViewByBinIDScreen> {
  int? _expandedIndex; // Track which card is expanded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333), // Dark gray background
      appBar: AppBar(
        backgroundColor: const Color(0x00ffe4c4), // Beige app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          children: [
            Text(
              'WH ID: W101',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold, // Bold WH ID
              ),
            ),
            Text(
              'Bin ID: B012',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold, // Bold Bin ID
              ),
            ),
          ],
        ),
        centerTitle: true, // Center align the title
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/profile_and_settings'); // Navigate to ProfileAndSettingsPage
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Row (Select Button and Dropdown)
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align "Select" to the right
              children: [
                Text(
                  'Select',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8), // Optional space between text and icon
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // List of stock items (scrollable)
            ListView.builder(
              shrinkWrap: true, // Allows ListView to fit its content
              physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
              itemCount: 5, // Adjust item count as needed
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle expanded card, or collapse if already expanded
                      _expandedIndex = (_expandedIndex == index) ? null : index;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _expandedIndex == null || _expandedIndex == index ? 1.0 : 0.3, // Fade others
                    child: StockItemCard(
                      isExpanded: _expandedIndex == index, // Pass expanded state
                      isComplete: index % 2 == 0, // Alternate sync status
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StockItemCard extends StatelessWidget {
  final bool isExpanded;
  final bool isComplete;

  const StockItemCard({super.key, required this.isExpanded, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light gray background for each card
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row (Timestamp and status icon)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Timestamp',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isComplete ? Colors.green : Colors.red, // Sync status
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // HU ID and Quantity in one row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HU ID',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Product ID and Batch ID on the same line
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product ID',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10), // Space between Product ID and Batch ID
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Batch ID',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // UoM on the right
                Text(
                  'UoM',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Expanded content (visible when the card is expanded)
            if (isExpanded) ...[
              const SizedBox(height: 8),
              const Text(
                'Additional details about this stock item, like more metadata, description, or actions.',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}