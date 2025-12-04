import 'package:flutter/material.dart';
import 'package:restaurant/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap)  {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Vamos Cozinhar?',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(Icons.restaurant, 'Refeições',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          _createItem(Icons.settings,  'Configurações',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}
