import 'package:flutter/material.dart';
import 'package:restaurant/components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Configurações'),),
           drawer: MainDrawer(),
           body: Center(
            child: Text('Configurações'),
           ),
       );
  }
}