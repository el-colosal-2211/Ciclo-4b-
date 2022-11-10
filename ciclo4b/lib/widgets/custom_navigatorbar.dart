import 'package:ciclo4b/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      selectedFontSize: 20,
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner_outlined),
          label: 'Scanner',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner_outlined),
          label: 'PDf',
        ),
      ],
    );
  }
}
