// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quote_of_the_day_app/data/sample_data.dart';
import 'package:quote_of_the_day_app/models/quote.dart';
import 'package:quote_of_the_day_app/screens/favorite_quote_screen.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote _currentQuote;
  final List<Quote> _favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadRandomQuote();
  }

  void _loadRandomQuote() {
    final random = Random();
    setState(() {
      _currentQuote = sampleQuotes[random.nextInt(sampleQuotes.length)];
    });
  }

  void _shareQuote() {
    Share.share('"${_currentQuote.text}" - ${_currentQuote.author}');
  }

  void _toggleFavorite() {
    setState(() {
      if (_favoriteQuotes.contains(_currentQuote)) {
        _favoriteQuotes.remove(_currentQuote);
      } else {
        _favoriteQuotes.add(_currentQuote);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quote of the Day',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 193, 239, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '"${_currentQuote.text}"',
              style: const TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '- ${_currentQuote.author}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _loadRandomQuote,
                  tooltip: 'Refresh Quote',
                  color: Color.fromARGB(255, 7, 23, 255),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: _shareQuote,
                  tooltip: 'Share Quote',
                  color: Color.fromARGB(255, 7, 52, 255),
                ),
                IconButton(
                  icon: Icon(
                    _favoriteQuotes.contains(_currentQuote)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: _favoriteQuotes.contains(_currentQuote)
                        ? Colors.red
                        : null,
                  ),
                  onPressed: _toggleFavorite,
                  tooltip: 'Favorite',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FavoriteQuotesScreen(favoriteQuotes: _favoriteQuotes),
            ),
          );
        },
        tooltip: 'View Favorites',
      ),
      backgroundColor: Color.fromARGB(255, 39, 177, 83),
    );
  }
}
