import 'package:flutter/material.dart';
import 'package:restaurant/models/category.dart';
import 'package:restaurant/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {

  
  final Category category;

  const CategoryItem({ super.key, required this.category });

  // função para navegar para a tela de refeições por categoria
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoryMeals,
      arguments: category,
    );
  }

   @override
   Widget build(BuildContext context) {
       return InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
         onTap: () => _selectCategory(context),
         child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: category.color,
            gradient: LinearGradient(
              colors: [
                category.color.withValues(alpha: 0.7),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
               ),
       );
  }
}