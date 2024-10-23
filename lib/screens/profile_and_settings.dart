import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C3D37), // Set the primary background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow under the app bar
        toolbarHeight: 55, // Set the height of the toolbar
        flexibleSpace: Container(
          color: const Color(0xFFECDFCC), // Banner color
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 35.0), // Add top padding
              child: Text(
                'Profile and Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Set font size to 20
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0), // Adjust horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center-align the buttons
          children: [
            const SizedBox(height: 20), // Top gap to prevent overflow
            // Organization ID section
            const SettingsButton(
              label: "Organisation ID:                     Stel2104",
            ),
            const SizedBox(height: 8), // Small gap between buttons
            // User ID section
            const SettingsButton(
              label: "User ID:                                         U101",
            ),
            const SizedBox(height: 8), // Small gap between buttons
            // FAQs section
            const SettingsButton(
              label: "FAQ's",
            ),
            const SizedBox(height: 8), // Small gap between buttons
            // End User License Agreement
            const SettingsButton(
              label: "End User License Agreement",
            ),
            const SizedBox(height: 8), // Small gap between buttons
            // User Guide
            const SettingsButton(
              label: "User Guide",
            ),
            const SizedBox(height: 8), // Small gap between buttons
            // About
            const SettingsButton(
              label: "About",
            ),
            const Spacer(),
            // Log Out Button
            ElevatedButton.icon(
              onPressed: () {
                // Show confirmation dialog when Log Out is clicked
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Logout"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog, stay on the same page
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/'); // Navigate to login page
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Make button full-width
                backgroundColor: const Color(0xFFCCCCCC), // Set button background to light gray
                foregroundColor: Colors.black, // Text/Icon color (foreground)
              ),
            ),
            const SizedBox(height: 20), // Space between the button and the footer
            // Version Info at the bottom
            const Center(
              child: Text(
                "Stellium Stock Take App, version 1.0.2.\nAll rights reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, // Text color for the footer
                  fontSize: 12,
                  fontWeight: FontWeight.bold, // Text in bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String label;

  const SettingsButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5), // Adjust gap between buttons
      decoration: BoxDecoration(
        color: const Color(0xFFCCCCCC), // Light gray button background (primary)
        borderRadius: BorderRadius.circular(4), // Slight border radius for buttons
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Foreground (onPrimary)
            fontWeight: FontWeight.bold, // Text in bold
          ),
        ),
        onTap: () {
          // Action when this button is tapped
        },
      ),
    );
  }
}
