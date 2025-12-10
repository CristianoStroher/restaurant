import 'package:flutter/material.dart';
import 'package:restaurant/data/dummy_data.dart';
import 'package:restaurant/models/meal.dart';
import 'package:restaurant/models/settings.dart';
import 'package:restaurant/screens/category_meals_screen.dart';
import 'package:restaurant/screens/meal_detail_screen.dart';
import 'package:restaurant/screens/settings_screen.dart';
import 'package:restaurant/screens/tabs_screen.dart';
import 'package:restaurant/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = dummyMeals;

  // Função para filtrar as refeições com base nas configurações
  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        if (settings.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (settings.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (settings.isVegan && !meal.isVegan) {
          return false;
        }
        if (settings.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          primary: Colors.pink, // cor principal
          secondary: Colors.amber, // cor secundária
        ),
        useMaterial3: false,
        canvasColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ), // cor de fundo do app
        fontFamily: 'Raleway', // fonte padrao do app
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            // estilo padrao do texto do app normal
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: const TextStyle(
            // estilo padrao do texto do app medio
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            // estilo padrao do texto do app grande
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const TabsScreen(), // rota inicial
        AppRoutes.categoryMeals: (ctx) => CategoryMealsScreen(meals: _availableMeals), // rota para a tela de refeições por categoria
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(), // rota para a tela de detalhes da refeição
        AppRoutes.settings: (ctx) => SettingsScreen(onSettingsChanged: _filterMeals), // rota para tela de configurações
      },
    );
  }
}
