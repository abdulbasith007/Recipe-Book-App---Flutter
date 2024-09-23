import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, String> recipe;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  DetailsScreen({required this.recipe, required this.isFavorite, required this.onFavoriteToggle});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Text(widget.recipe['ingredients']!),
            SizedBox(height: 16),
            Text('Instructions:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Text(widget.recipe['instructions']!),
            Spacer(),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Text(isFavorite ? 'Unmark Favorite' : 'Mark as Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
