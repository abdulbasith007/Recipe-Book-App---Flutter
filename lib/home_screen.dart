import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

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
        title: Text('Recipe Book', style: TextStyle(fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteRecipes: favoriteRecipes,
                    onRecipeTap: (recipe) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            recipe: recipe,
                            isFavorite: favoriteRecipes.contains(recipe),
                            onFavoriteToggle: () => toggleFavorite(recipe),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  recipes[index]['name']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    favoriteRecipes.contains(recipes[index]) ? Icons.favorite : Icons.favorite_border,
                    color: favoriteRecipes.contains(recipes[index]) ? Colors.red : null,
                  ),
                  onPressed: () => toggleFavorite(recipes[index]),
                ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
