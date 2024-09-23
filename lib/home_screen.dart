import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {'name': 'Pasta', 'ingredients': 'Pasta, Tomato Sauce, Cheese', 'instructions': 'Boil pasta, add sauce, and sprinkle cheese.'},
    {'name': 'Pizza', 'ingredients': 'Dough, Tomato Sauce, Cheese, Pepperoni', 'instructions': 'Roll dough, add sauce, cheese, and pepperoni. Bake.'},
    {'name': 'Salad', 'ingredients': 'Lettuce, Tomato, Cucumber, Dressing', 'instructions': 'Chop veggies and add dressing.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
