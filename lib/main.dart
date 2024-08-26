import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_for_all/about.dart';
import 'package:quotes_for_all/privacy.dart';
import 'package:quotes_for_all/settings.dart';
import 'package:quotes_for_all/splash.dart';
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
      debugShowCheckedModeBanner: false,
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
        '/': (context) => const SplashScreen(),
        '/quote': (context) => const QuoteScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        //HomeScreen
        '/home': (context) => const HomeScreen(),

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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite, size: 40),
                        onPressed: () {
                          Navigator.pushNamed(context, '/favorites');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.info, size: 40),
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.security, size: 40),
                        onPressed: () {
                          Navigator.pushNamed(context, '/privacy');
                        },
                      ),
                    ],
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

class _QuoteScreenState extends State<QuoteScreen>
    with SingleTickerProviderStateMixin {
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
        text:
            "Success is not the absence of failure; it's the persistence through failure.",
        author: "Aisha Tyler"),
    Quote(
        text:
            "Success is liking yourself, liking what you do, and liking how you do it.",
        author: "Maya Angelou"),
    Quote(
        text:
            "The road to success and the road to failure are almost exactly the same.",
        author: "Colin R. Davis"),
    Quote(
        text:
            "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.",
        author: "Albert Schweitzer"),
    Quote(
        text:
            "Success is not how high you have climbed, but how you make a positive difference to the world.",
        author: "Roy T. Bennett"),
    Quote(
        text:
            "Your time is limited, don't waste it living someone else's life.",
        author: "Steve Jobs"),
    Quote(
        text:
            "The only way to achieve the impossible is to believe it is possible.",
        author: "Charles Kingsleigh"),
    Quote(
        text:
            "Success is not the absence of failure; it's the persistence through failure.",
        author: "Aisha Tyler"),
    Quote(
        text:
            "Success is liking yourself, liking what you do, and liking how you do it.",
        author: "Maya Angelou"),
    Quote(
        text: "To live a creative life, we must lose our fear of being wrong.",
        author: "Anonymous"),
    Quote(
        text:
            "If you are not willing to risk the usual, you will have to settle for the ordinary.",
        author: "Jim Rohn"),
    Quote(
        text:
            "Trust because you are willing to accept the risk, not because it's safe or certain.",
        author: "Anonymous"),
    Quote(
        text:
            "All our dreams can come true if we have the courage to pursue them.",
        author: "Walt Disney"),
    Quote(
        text:
            "Good things come to people who wait, but better things come to those who go out and get them.",
        author: "Anonymous"),
    Quote(
        text:
            "If you do what you always did, you will get what you always got.",
        author: "Anonymous"),
    Quote(
        text:
            "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.",
        author: "Albert Schweitzer"),
    Quote(
        text:
            "Success is not how high you have climbed, but how you make a positive difference to the world.",
        author: "Roy T. Bennett"),
    Quote(
        text:
            "Your time is limited, don't waste it living someone else's life.",
        author: "Steve Jobs"),
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
        text:
            "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        author: "Winston Churchill"),
    Quote(
        text: "Don't watch the clock; do what it does. Keep going.",
        author: "Sam Levenson"),
    Quote(
        text:
            "Keep your face always toward the sunshine—and shadows will fall behind you.",
        author: "Walt Whitman"),
    Quote(
        text:
            "The only limit to our realization of tomorrow is our doubts of today.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text:
            "The future belongs to those who believe in the beauty of their dreams.",
        author: "Eleanor Roosevelt"),
    Quote(
        text:
            "It does not matter how slowly you go as long as you do not stop.",
        author: "Confucius"),
    Quote(
        text: "Everything you’ve ever wanted is on the other side of fear.",
        author: "George Addair"),
    Quote(
        text: "Believe you can and you're halfway there.",
        author: "Theodore Roosevelt"),
    Quote(
        text: "Act as if what you do makes a difference. It does.",
        author: "William James"),
    Quote(
        text:
            "Success usually comes to those who are too busy to be looking for it.",
        author: "Henry David Thoreau"),
    Quote(
        text: "Don't be afraid to give up the good to go for the great.",
        author: "John D. Rockefeller"),
    Quote(
        text: "I find that the harder I work, the more luck I seem to have.",
        author: "Thomas Jefferson"),
    Quote(
        text: "Success is not in what you have, but who you are.",
        author: "Bo Bennett"),
    Quote(
        text: "The way to get started is to quit talking and begin doing.",
        author: "Walt Disney"),
  ];

  late Quote currentQuote;
  bool isFavorite = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    currentQuote = _getRandomQuote();
    _checkIfFavorite();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    // Add this line to trigger the animation for the initial quote
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
    _animationController.forward(from: 0.0);
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          // title: const Text('Inspirational Quotes',
          //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          // backgroundColor: Colors.black,
          ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FadeTransition(
                    opacity: _animation,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              currentQuote.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '- ${currentQuote.author}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('NEXT QUOTE'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: _changeQuote,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFavorite ? Colors.red : Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: const CircleBorder(),
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
                      shape: const CircleBorder(),
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('FAVORITES',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favoriteQuotes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border,
                      size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 20),
                  Text(
                    'No favorite quotes yet.',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Add quotes to your favorites to see them here.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey[500]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                final quote = favoriteQuotes[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Dismissible(
                    key: Key(quote.text),
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _removeFavorite(quote);
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              quote.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontStyle: FontStyle.normal),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '- ${quote.author}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share,
                                      color: Colors.blue),
                                  onPressed: () {
                                    Share.share(
                                        '${quote.text} - ${quote.author}');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
