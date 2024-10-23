import 'package:flutter/material.dart';
import 'screens/warehouse_selection_screen.dart';
import 'screens/login_page.dart';
import 'screens/stocktake_screen.dart';
import 'screens/stocktake_form_screen.dart';
import 'screens/view_by_bin_id.dart';
import 'screens/view_stocktake.dart';
import 'screens/profile_and_settings.dart';
import 'screens/barcode_scanner_screen.dart' as barcode; // Import with alias

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/warehouse_selection': (context) => const WarehouseSelectionScreen(),
        '/stocktake': (context) => const StocktakeScreen(),
        '/view_stocktake': (context) => const StocktakePage(),
        '/stocktake_form': (context) => const StocktakeFormScreen(),
        '/view_by_binID': (context) => const ViewByBinIDScreen(),
        '/profile_and_settings': (context) => const ProfileSettingsPage(),
        '/barcode_scanner': (context) => barcode.BarcodeScannerScreen(
          onBarcodeScanned: (String barcode) {
            // Handle barcode scan result
          }, onScan: (String ) {  },
        ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
