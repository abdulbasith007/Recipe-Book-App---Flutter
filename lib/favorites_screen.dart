import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteRecipes;
  final Function(Map<String, String>) onRecipeTap;

  FavoritesScreen({required this.favoriteRecipes, required this.onRecipeTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.teal,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: ListTile(
                    title: Text(
                      favoriteRecipes[index]['name']!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => onRecipeTap(favoriteRecipes[index]),
                  ),
                );
              },
            ),
    );
  }
}
