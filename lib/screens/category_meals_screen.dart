import 'package:flutter/material.dart';
import 'package:restaurant/components/main_drawer.dart';
import 'package:restaurant/components/meal_item.dart';
import 'package:restaurant/data/dummy_data.dart';
import 'package:restaurant/models/category.dart';
import 'package:restaurant/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  
  final List<Meal> meals;

  const CategoryMealsScreen({super.key, required this.meals});



   @override
   Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    // Criado uma variável para armazenar as refeições filtradas pela categoria selecionada
    final  categoryMeals  = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

       return Scaffold(
           appBar: AppBar(title: Text(category.title),),
           drawer: const MainDrawer(),
           body: ListView.builder(
             itemCount: categoryMeals.length,
             itemBuilder: (ctx, index) {
               return MealItem(meal: categoryMeals[index]);
             },
           ),
       );
  }
}