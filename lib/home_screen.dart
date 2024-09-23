import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favourites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> recipes = [
    {'name': 'Pasta', 'ingredients': 'Pasta, Tomato Sauce, Cheese', 'instructions': 'Boil pasta, add sauce, and sprinkle cheese.'},
    {'name': 'Pizza', 'ingredients': 'Dough, Tomato Sauce, Cheese, Pepperoni', 'instructions': 'Roll dough, add sauce, cheese, and pepperoni. Bake.'},
    {'name': 'Salad', 'ingredients': 'Lettuce, Tomato, Cucumber, Dressing', 'instructions': 'Chop veggies and add dressing.'},
  ];

  List<Map<String, String>> favoriteRecipes = [];

  void toggleFavorite(Map<String, String> recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
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
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index],
                    isFavorite: favoriteRecipes.contains(recipes[index]),
                    onFavoriteToggle: () => toggleFavorite(recipes[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
