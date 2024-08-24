import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_for_all/about.dart';
import 'package:quotes_for_all/privacy.dart';
import 'package:quotes_for_all/settings.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brutalist Quotes',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Courier'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/quote': (context) => const QuoteScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        // '/privacy': (context) => const PrivacyPolicyPage(),
        //   Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => WebViewPage(title: title, url: url),
        //   ),
        // );
        '/privacy': (context) => const WebViewPage(
              title: 'Privacy Policy',
              url: 'https://www.google.com',
            ),

        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'BRUTALIST\nQUOTES',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quote');
                    },
                    child: const Text('GET INSPIRED',
                        style: TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child:
                        const Text('FAVORITES', style: TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: const Text('ABOUT', style: TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/privacy');
                    },
                    child: const Text('PRIVACY POLICY',
                        style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  Map<String, dynamic> toJson() => {
        'text': text,
        'author': author,
      };

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        text: json['text'],
        author: json['author'],
      );
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<Quote> quotes = [
    Quote(
        text: "Be yourself; everyone else is already taken.",
        author: "Oscar Wilde"),
    Quote(
        text:
            "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
        author: "Albert Einstein"),
    Quote(
        text: "Be the change that you wish to see in the world.",
        author: "Mahatma Gandhi"),
    Quote(
        text: "I have not failed. I've just found 10,000 ways that won't work.",
        author: "Thomas Edison"),
    Quote(
        text: "If you tell the truth, you don't have to remember anything.",
        author: "Mark Twain"),
    Quote(
        text:
            "A friend is someone who knows all about you and still loves you.",
        author: "Elbert Hubbard"),
    Quote(
        text:
            "I have a dream that my four little children will one day live in a nation where they will not be judged by the color of their skin but by the content of their character.",
        author: "Martin Luther King Jr."),
    Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
    Quote(
        text: "The only thing we have to fear is fear itself.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    Quote(
        text: "The only thing we have to fear is fear itself.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    Quote(
        text: "The only thing we have to fear is fear itself.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    Quote(
        text: "The only thing we have to fear is fear itself.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    Quote(
        text: "The only thing we have to fear is fear itself.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),

    // Add more quotes here
  ];

  late Quote currentQuote;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    currentQuote = _getRandomQuote();
    _checkIfFavorite();
  }

  Quote _getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  void _changeQuote() {
    setState(() {
      currentQuote = _getRandomQuote();
      _checkIfFavorite();
    });
  }

  void _checkIfFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      isFavorite =
          favorites.contains('${currentQuote.text}|${currentQuote.author}');
    });
  }

  void _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    final quoteString = '${currentQuote.text}|${currentQuote.author}';

    setState(() {
      if (isFavorite) {
        favorites.remove(quoteString);
      } else {
        favorites.add(quoteString);
      }
      isFavorite = !isFavorite;
    });

    await prefs.setStringList('favorites', favorites);
  }

  void _shareQuote() {
    Share.share('${currentQuote.text} - ${currentQuote.author}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        currentQuote.text,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '- ${currentQuote.author}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      onPressed: _changeQuote,
                      child: const Text('NEXT QUOTE',
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    onPressed: _toggleFavorite,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    onPressed: _shareQuote,
                    child: const Icon(Icons.share, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Quote> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      favoriteQuotes = favorites.map((quoteString) {
        final parts = quoteString.split('|');
        return Quote(text: parts[0], author: parts[1]);
      }).toList();
    });
  }

  void _removeFavorite(Quote quote) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove('${quote.text}|${quote.author}');
    await prefs.setStringList('favorites', favorites);
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FAVORITES', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favoriteQuotes.isEmpty
          ? Center(
              child: Text(
                'No favorite quotes yet.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                final quote = favoriteQuotes[index];
                return Dismissible(
                  key: Key(quote.text),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _removeFavorite(quote);
                  },
                  child: ListTile(
                    title: Text(quote.text),
                    subtitle: Text('- ${quote.author}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        Share.share('${quote.text} - ${quote.author}');
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
