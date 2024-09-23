import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> recipes = [
  {
    'name': 'Biryani',
    'ingredients': 'Rice, Chicken, Yogurt, Spices, Onions, Tomatoes',
    'instructions': 'Marinate chicken with yogurt and spices. Layer with rice and cook on low heat until done.'
  },
  {
    'name': 'Haleem',
    'ingredients': 'Wheat, Meat (Beef or Chicken), Lentils, Spices, Ghee',
    'instructions': 'Cook meat and lentils until tender. Blend and mix with wheat paste and spices. Garnish with fried onions and serve.'
  },
  {
    'name': 'Butter Chicken',
    'ingredients': 'Chicken, Butter, Cream, Tomato Puree, Spices',
    'instructions': 'Cook marinated chicken. Prepare rich gravy with butter, cream, and spices. Add chicken to the gravy and simmer.'
  },
  {
    'name': 'Chole Bhature',
    'ingredients': 'Chickpeas, Flour, Yogurt, Spices, Onions, Tomatoes',
    'instructions': 'Cook chickpeas with spices. Fry the yogurt-based dough into fluffy bhature. Serve with chole.'
  },
  {
    'name': 'Dosa',
    'ingredients': 'Rice, Urad Dal, Ghee, Potato Filling, Spices',
    'instructions': 'Prepare batter with rice and urad dal. Spread on a pan, fill with spiced potato mix, and fold.'
  },
  {
    'name': 'Pasta',
    'ingredients': 'Pasta, Tomato Sauce, Cheese',
    'instructions': 'Boil pasta, add sauce, and sprinkle cheese.'
  },
  {
    'name': 'Pizza',
    'ingredients': 'Dough, Tomato Sauce, Cheese, Pepperoni',
    'instructions': 'Roll dough, add sauce, cheese, and pepperoni. Bake.'
  },
  {
    'name': 'Salad',
    'ingredients': 'Lettuce, Tomato, Cucumber, Dressing',
    'instructions': 'Chop veggies and add dressing.'
  },
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
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
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
              child: Text('View Favorites'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}
