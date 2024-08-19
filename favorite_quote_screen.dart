// lib/screens/favorite_quotes_screen.dart
import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/models/quote.dart';

class FavoriteQuotesScreen extends StatelessWidget {
  final List<Quote> favoriteQuotes;

  FavoriteQuotesScreen({required this.favoriteQuotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Quotes',
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteQuotes.length,
        itemBuilder: (context, index) {
          final quote = favoriteQuotes[index];
          return ListTile(
            title: Text(
              '"${quote.text}"',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              '- ${quote.author}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 254, 254)),
            ),
          );
        },
      ),
      backgroundColor: Color.fromARGB(255, 27, 189, 73),
    );
  }
}
