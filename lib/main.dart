import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // এই কোডে MyApp নামে একটি Flutter অ্যাপ্লিকেশনের মূল ক্লাস তৈরি করা হয়েছে, যা StatelessWidget ক্লাস থাকছে।
  const MyApp(
      {super.key}); //এই লাইনে MyApp ক্লাস একটি কন্সট্রাক্টর পাচ্ছে যা super.key কে প্যারামিটার হিসেবে ধারণ করছে।

  @override
  Widget build(BuildContext context) {
    // এই লাইনে build মেথড লেখা হয়েছে, যা Flutter এপ্লিকেশনের UI বিল্ড করতে ব্যবহার হয়।
    return ChangeNotifierProvider(
      //এই লাইনে ChangeNotifierProvider হলো একটি Flutter প্যাকেজ provider এর কম্পোনেন্ট, যা স্টেট ম্যানেজমেন্টের জন্য ব্যবহৃত হয়।
      create: (context) =>
          MyAppState(), // এই লাইনে ChangeNotifierProvider এর create প্যারামিটারে MyAppState ক্লাসের একটি নতুন অবজেক্ট তৈরি করা হয়।
      child: MaterialApp(
        // এই লাইনে MaterialApp এর একটি ইন্সট্যান্স তৈরি করা হয়, যা Flutter এপ্লিকেশনের মেটেরিয়াল ডিজাইন এবং রাউটিং সহ অনেক ফিচার সরবরাহ করে।
        title: 'Namer App', //  এই লাইনে এপ্লিকেশনের শীর্ষক সেট করা হয়েছে।
        theme: ThemeData(
          // এই লাইনে MaterialApp এর থিম প্যারামিটার হিসেবে ThemeData ইনস্ট্যান্স দেওয়া হয়েছে।
          useMaterial3:
              true, // এই লাইনে MaterialApp এর থিমের useMaterial3 প্যারামিটারটি ট্রু হিসেবে সেট করা হয়েছে।
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors
                  .deepOrange), // এই লাইনে MaterialApp এর থিমের colorScheme প্যারামিটারটি সেট করা হয়েছে, যেটি সীড কালার হিসেবে Colors.deepOrange নিয়ে থাকে।
        ),
        home:
            MyHomePage(), // এই লাইনে MaterialApp এর home প্যারামিটারটি সেট করা হয়েছে, যা হোম পেজ হিসেবে MyHomePage ক্লাসের ইনস্ট্যান্স নিয়ে থাকে।
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // এই কোডে MyAppState নামে একটি Flutter স্টেট ক্লাস তৈরি করা হয়েছে, যা ChangeNotifier ক্লাস থেকে একটি সাবক্লাস।
  var current = WordPair
      .random(); // এই লাইনে একটি ভ্যারিয়েবল current তৈরি করা হয়েছে যা একটি বিশেষ কিছু ডেটা ধারণ করে, এখানে এটি WordPair.random() দিয়ে একটি র‍্যান্ডম WordPair অবজেক্টের মান নেয়।

  void getNext() {
    // এই মেথডে getNext কে ডিফাইন করা হয়েছে।
    current = WordPair
        .random(); // এটি current ভ্যারিয়েবলে একটি নতুন WordPair র‍্যান্ডমভাবে সেট করে
    notifyListeners(); // এবং তারপর notifyListeners() কল করে।
  } // এটি করে স্টেট পরিবর্তনের সত্ত্বে অব্জার্ভারগুলি (যেমন ChangeNotifierProvider) আপডেট হয়।

  var favorites =
      <WordPair>[]; // এই লাইনে একটি ভ্যারিয়েবল favorites তৈরি করা হয়েছে, যা WordPair অবজেক্টের একটি লিস্ট হিসেবে কাজ করবে।

  void toggleFavorite() {
    // এই মেথডে toggleFavorite কে ডিফাইন করা হয়েছে।
    if (favorites.contains(current)) {
      // এটি favorites লিস্টে current ডেটা লিস্ট এ আছে কি না চেক করে।
      favorites.remove(
          current); // এটি favorites লিস্টে current ডেটা থাকলে তাকে লিস্ট থেকে মুছে ফেলে
    } else {
      favorites.add(
          current); // এটি favorites লিস্টে current ডেটা না থাকলে তাকে লিস্টে যোগ করে।
    }
    notifyListeners(); // এরপর notifyListeners() কল করে যাতে স্টেট পরিবর্তন হলে অব্জার্ভারগুলি আপডেট হয়।
  }
}

class MyHomePage extends StatefulWidget {
  // এই লাইনে, একটি নতুন স্টেটফুল উইজেট MyHomePage ডিফাইন করা হয়েছে, যা একটি Flutter হোম পেজ বা স্ক্রিন প্রদর্শন করতে ব্যবহৃত হতে পারে।
  @override // এটি একটি অভাররাইড এ্যানোটেশন, যা দেখা যাচ্ছে যে এই ক্লাসটি StatefulWidget ক্লাস হিসেবে ব্যবহৃত হবে এবং এই ক্লাসে একটি স্টেটফুল স্টেট তৈরি করতে হবে।
  State<MyHomePage> createState() =>
      _MyHomePageState(); // এই লাইনে, MyHomePage ক্লাসের স্টেট তৈরি করতে হবে এবং সেটি _MyHomePageState ক্লাসের একটি ইনস্ট্যান্স হিসেবে থাকতে হবে।
  //_MyHomePageState হলো স্টেটফুল স্টেট ক্লাস যা MyHomePage ক্লাসের অংশ হিসেবে থাকবে।
}

class _MyHomePageState extends State<MyHomePage> {
  // এই লাইনে, _MyHomePageState ক্লাস ডিফাইন হয়েছে, যা MyHomePage ক্লাসের স্টেটফুল স্টেট ক্লাস।
  var selectedIndex =
      0; // এই লাইনে, একটি ভ্যারিয়েবল selectedIndex ডিফাইন করা হয়েছে, যা হোম এবং প্রিয়শ্রেণীতে ট্যাবের মধ্যে বর্তমান নির্বাচিত ট্যাবের ইন্ডেক্সটি সংরক্ষণ করে।

  @override // এটি একটি অভাররাইড এ্যানোটেশন, যা দেখা যাচ্ছে যে _MyHomePageState ক্লাসটি State<MyHomePage> ক্লাস হিসেবে ব্যবহৃত হবে।
  Widget build(BuildContext context) {
    // এই লাইনে, build মেথড ডিফাইন করা হয়েছে, যা হোম এবং প্রিয়শ্রেণীতে ট্যাবের মধ্যে বর্তমান নির্বাচিত ট্যাবের উইজেট প্রদর্শন করতে ব্যবহৃত হয়।
    Widget
        page; // এই লাইনে, page নামে একটি উইজেট ভ্যারিয়েবল ডিফাইন করা হয়, যা প্রস্তুত থাকতে হবে ট্যাব বিন্যাস অনুযায়ী বর্তমান নির্বাচিত ট্যাবের উইজেট প্রদর্শন করতে।
    switch (selectedIndex) {
      // এই লাইনে, একটি switch স্টেটমেন্ট ব্যবহৃত হয়েছে যাতে selectedIndex এর ভিত্তিতে বর্তমান নির্বাচিত ট্যাবের উইজেট প্রস্তুত করা যায়।
      case 0: //  এই লাইনে, যদি selectedIndex এর মান 0 হয়,
        page =
            GeneratorPage(); // তাহলে page উইজেটে হোম পেজের উইজেট GeneratorPage সেট করা হয়।
      case 1: // এই লাইনে, যদি selectedIndex এর মান 1 হয়,
        page =
            FavoritesPage(); // তাহলে page উইজেটে প্রিয়শ্রেণী পেজের উইজেট FavoritesPage সেট করা হয়।
      default: // এই লাইনে, যদি selectedIndex এর মান আগের দুইটি কেসের যেকোন একটি না হয়,
        throw UnimplementedError(
            'no widget for $selectedIndex'); // তাহলে একটি অজানা এরর থ্রো করা হয় যেটি দেখায় "no widget for $selectedIndex" এই মেসেজ।
    }

    return LayoutBuilder(builder: (context, constraints) {
      // এই লাইনে, LayoutBuilder ব্যবহৃত হয়েছে, যাতে উইজেটের আকার অনুযায়ী বিভিন্ন বৈচিত্র্য আছে এবং এটি একটি স্ক্রীন আকার ভিত্তিতে বোঝা যায়।
      return Scaffold(
        // এই লাইনে, Scaffold উইজেট ব্যবহৃত হয়েছে যাতে স্ক্রিনে ন্যাভিগেশন রেল এবং বিভিন্ন ট্যাবগুলি দেখানো যায়।
        body: Row(
          // এই লাইনে, স্ক্রিনে একটি Row উইজেট দেখানো হয়েছে যা ন্যাভিগেশন রেল এবং বোডি এলিমেন্ট থাকবে।
          children: [
            //
            SafeArea(
              // এই লাইনে, একটি SafeArea উইজেট দেখানো হয়, যাতে উইজেটগুলি স্ক্রিনের বাইরের এলিমেন্টগুলির কাছে থাকতে পারে এবং ইনফরমেশন বারের এলিমেন্টগুলির সাথে কোন সংঘর্ষ হয় না।
              child: NavigationRail(
                // এই লাইনে, একটি NavigationRail উইজেট দেখানো হয়, যা স্ক্রিনে আমাদের নিজেদের ডেস্টোপ স্ক্রিনে একটি বাস্তব ন্যাভিগেশন রেল প্রদর্শন করে।
                extended: constraints.maxWidth >=
                    600, //  এই লাইনে, স্ক্রিনের প্রস্থ ব্যাপ্তি 600 পিক্সেল বা তার উর্ধে হলে extended মূলকটি সত্য হবে, অন্যথায় মূলকটি মিথ্যা হবে। এটি ব্যবহার হয় ন্যাভিগেশন রেলের এক্সটেন্ডেড বা সাম্প্রতিক্ষ মোডে থাকতে বা সাধারিত মোডে থাকতে।
                destinations: [
                  // এই লাইনে, একটি লিস্ট অব্জেক্টে সমস্ত ন্যাভিগেশন রেল ট্যাবের তথ্য সংরক্ষণ করা হয়েছে।
                  NavigationRailDestination(
                    // প্রতিটি NavigationRailDestination উইজেট একটি ট্যাবের বৈশিষ্ট্য যোগ করে, যা একটি আইকন এবং একটি লেবেল শহস্ত্র করে।
                    icon: Icon(Icons
                        .home), // এই লাইনে, একটি হৃদয় আইকন (Icon(Icons.home)) সহ NavigationRailDestination উইজেট তৈরি করা হয়েছে। এই আইকনটি প্রিয়শ্রেণী ট্যাবের প্রতীক হিসেবে ব্যবহৃত হবে।
                    label: Text(
                        'Home'), // এই লাইনে, টেক্সট উইজেট (Text('Home')) সহ NavigationRailDestination উইজেট তৈরি করা হয়েছে যা প্রিয়শ্রেণী ট্যাবের লেবেল হিসেবে ব্যবহৃত হবে। এই লেবেলটি ব্যবহারকারীকে বোঝাতে সাহায্য করতে থাকে যে এই ট্যাবটি কোন কাজের সাথে সংবলিত আছে।
                  ),
                  NavigationRailDestination(
                    // প্রতিটি NavigationRailDestination উইজেট একটি ট্যাবের বৈশিষ্ট্য যোগ করে, যা একটি আইকন এবং একটি লেবেল শহস্ত্র করে।
                    icon: Icon(Icons
                        .favorite), //এই লাইনে, একটি হৃদয় আইকন (Icon(Icons.favorite)) সহ NavigationRailDestination উইজেট তৈরি করা হয়েছে। এই আইকনটি প্রিয়শ্রেণী ট্যাবের প্রতীক হিসেবে ব্যবহৃত হবে।
                    label: Text(
                        'Favorites'), // এই লাইনে, টেক্সট উইজেট (Text('Favorites')) সহ NavigationRailDestination উইজেট তৈরি করা হয়েছে যা প্রিয়শ্রেণী ট্যাবের লেবেল হিসেবে ব্যবহৃত হবে। এই লেবেলটি ব্যবহারকারীকে বোঝাতে সাহায্য করতে থাকে যে এই ট্যাবটি কোন কাজের সাথে সংবলিত আছে।
                  ),
                ],
                selectedIndex:
                    selectedIndex, // এই লাইনে, বর্তমান নির্বাচিত ট্যাবের ইন্ডেক্স সংরক্ষণ করা হয়েছে।
                onDestinationSelected: (value) {
                  // এই লাইনে, ন্যাভিগেশন রেলের কোনও ট্যাবে ক্লিক করলে কী ঘটনা ঘটবে তা বোঝানো হয়েছে।
                  setState(() {
                    // এই লাইনে, ন্যাভিগেশন রেলের কোনও ট্যাবে ক্লিক করলে, বর্তমান নির্বাচিত ট্যাবের ইন্ডেক্সটি পরিবর্তন হয় এবং এটি অবজেক্টে স্টোর হয়।
                    selectedIndex =
                        value; // এই লাইনে, ন্যাভিগেশন রেলের কোনও ট্যাবে ক্লিক করলে বর্তমান নির্বাচিত ট্যাবের ইন্ডেক্সটি পরিবর্তন হচ্ছে। এই লাইনটি ব্যবহারকারীর ট্যাব নির্বাচনের ফলে বর্তমানে কোনও কোনও পৃষ্ঠা বা উইজেট দেখানোর জন্য ব্যবহৃত হয়। এটি অসম্ভাব্য এক্সেপশনগুলি এডভান্সড ডেভেলপমেন্টে একটি কাস্টম এক্সেপশন তৈরি করে তা বর্তমান নির্বাচিত ট্যাবের ইন্ডেক্স দিয়ে দেখাচ্ছে।
                  });
                },
              ),
            ),
            Expanded(
              // এই লাইনে, একটি Expanded উইজেট দেখানো হয়, যাতে এটির চাইল্ডগুলি উচ্চতা এবং দৈর্ঘ্য মোডিফাই করা হয় এবং তা পুরো উইজেটের অধিনায়ক অংশ প্রদর্শন করে।
              child: Container(
                // এই লাইনে, একটি Container উইজেট দেখানো হয়, যা একটি ব্যাকগ্রাউন্ড রং অথবা ছবি দেখানোর জন্য ব্যবহৃত হতে পারে এবং এটির চাইল্ড হিসেবে page উইজেট যোগ হয়েছে।
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer, // এই লাইনে, Theme.of(context).colorScheme.primaryContainer ব্যবহৃত হয়েছে যাতে কন্টেনারের ব্যাকগ্রাউন্ড রং ডাইনামিক হয়।
                child:
                    page, // এই লাইনে, একটি উইজেট page হিসেবে ব্যবহৃত হয়েছে, যা স্ক্রিনে প্রদর্শন করতে ব্যবহৃত হয়। page হলো বর্তমান নির্বাচিত ট্যাবের উইজেট, যা হোম পেজ বা প্রিয়শ্রেণী পেজের মধ্যে একটি যায়গা প্রদর্শন করবে। এই উইজেট একটি Container উইজেটের মধ্যে রয়েছে, এবং স্ক্রিনের ব্যাকগ্রাউন্ড রং অথবা ইমেজ এবং উইজেটের ব্যাকগ্রাউন্ড রং এবং বিভিন্ন উইজেট সাজানো হয়েছে।
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  // এই কোডে GeneratorPage নামে একটি Flutter স্টেটলেস উইজেট তৈরি করা হয়েছে, যা একটি শব্দ জেনারেট করে এবং তার সাথে একটি লাইক বাটন এবং একটি নেক্সট বাটন দেখায়।
  @override
  Widget build(BuildContext context) {
    // এই লাইনে build মেথড লেখা হয়েছে, যা Flutter এপ্লিকেশনের UI বিল্ড করতে ব্যবহার হয়।
    var appState = context.watch<
        MyAppState>(); // এই লাইনে context.watch ব্যবহৃত হয়েছে যাতে MyAppState ক্লাসের অবজেক্টের একটি রেফারেন্স প্রাপ্ত হয়।
    var pair = appState
        .current; // এই লাইনে appState.current থেকে বর্তমান শব্দজোড়ের তথ্য নেয়া হয় এবং এটি ভ্যারিয়েবল pair তে সংরক্ষণ করা হয়।

    IconData
        icon; // এই লাইনে একটি icon ভ্যারিয়েবল ডিফাইন করা হয়, যার মাধ্যমে লাইক বাটনের আইকন সেট করা হবে। যদি বর্তমান শব্দজোড়টি appState.favorites লিস্টে থাকে, তাদের জন্য আইকন হবে Icons.favorite, অন্যথায় তার জন্য হবে Icons.favorite_border।
    if (appState.favorites.contains(pair)) {
      //
      icon = Icons.favorite; //
    } else {
      icon = Icons.favorite_border; //
    }

    return Center(
      // এই লাইনে একটি Center উইজেট রিটার্ন করা হয়েছে, যা এই উইজেটের সব চাইল্ডগুলির মাঝে সেন্টার করবে।
      child: Column(
        // এই লাইনে একটি Column উইজেট দেখানো হয়েছে, যা চাইল্ড উইজেটগুলি উল্লেখ করে।
        mainAxisAlignment: MainAxisAlignment.center, //
        children: [
          //
          BigCard(
              pair:
                  pair), // এই লাইনে BigCard উইজেট দেখানো হয়, যা pair এর মাধ্যমে বর্তমান শব্দজোড় দেখায়।
          SizedBox(
              height:
                  10), // এই লাইনে একটি SizedBox উইজেট দেখানো হয়, যাতে উপরের উইজেট থেকে 10 একক উচ্চতা দূরে থাকে।
          Row(
            // এই লাইনে একটি Row উইজেট দেখানো হয়, যা চাইল্ড উইজেটগুলি একসাথে শালিক করবে।
            mainAxisSize: MainAxisSize.min, //
            children: [
              //
              ElevatedButton.icon(
                // এই লাইনে ElevatedButton.icon ব্যবহৃত হয়েছে, এটি একটি ইকোন এবং টেক্সটসহ একটি উচ্চতর বাটন তৈরি করে।
                onPressed: () {
                  // এই লাইনে লাইক বাটনে ক্লিক করলে কী ঘটনা ঘটবে তা সংরক্ষণ করা হয়েছে।
                  appState
                      .toggleFavorite(); // এখানে appState.toggleFavorite(); কল হবে যাতে বর্তমান শব্দজোড়টি প্রিয়শ্রেণীতে যোগ হতে পারে অথবা থেকে বাদ যাতে পারে।
                },
                icon: Icon(
                    icon), // এই লাইনে বাটনে দেখানো হয়েছে একটি আইকন, এটি হবে icon ভ্যারিয়েবলে সংরক্ষিত আইকন।
                label: Text(
                    'Like'), // এই লাইনে বাটনে যে টেক্সট দেখানো হবে তা সেট করা হয়েছে, এখানে 'Like' দেখানো হয়েছে।
              ),
              SizedBox(
                  width:
                      10), // এই লাইনে একটি SizedBox উইজেট দেখানো হয়, যাতে বাটনগুলির মধ্যে 10 একক দূরত্ব থাকে।
              ElevatedButton(
                // এই লাইনে ElevatedButton.icon ব্যবহৃত হয়েছে, এটি একটি ইকোন এবং টেক্সটসহ একটি উচ্চতর বাটন তৈরি করে।
                onPressed: () {
                  // এই লাইনে লাইক বাটনে ক্লিক করলে কী ঘটনা ঘটবে তা সংরক্ষণ করা হয়েছে।
                  appState
                      .getNext(); // এই লাইনে নেক্সট বাটনে ক্লিক করলে কী ঘটনা ঘটবে তা সংরক্ষণ করা হয়েছে, এখানে appState.getNext(); কল হবে যাতে বর্তমান শব্দজোড়টি পরিবর্তন হয়।
                },
                child: Text(
                    'Next'), // এই লাইনে বাটনে দেখানো হয়েছে একটি টেক্সট, এটি হবে 'Next'।
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  // এই কোডে BigCard নামে একটি Flutter স্টেটলেস উইজেট তৈরি করা হয়েছে, যা একটি বড় কার্ডে একটি শব্দের জোড় প্রদর্শন করে।
  const BigCard({
    // এই লাইনে একটি কন্সট্রাক্টর ডিফাইন করা হয়েছে যেটি BigCard উইজেটের ইন্সট্যান্স তৈরি করতে ব্যবহৃত হয়বে।
    super.key, //
    required this.pair, // এখানে required কীওয়ার্ড ব্যবহৃত হয়েছে যাতে pair অবজেক্ট অব্যাহতভাবে ডিফাইন করতে হয়।
  });

  final WordPair
      pair; // এই লাইনে pair নামে একটি ফাইনাল ভ্যারিয়েবল ডিফাইন করা হয়েছে, যা WordPair ক্লাসের একটি ইনস্ট্যান্স হবে।

  @override
  Widget build(BuildContext context) {
    // এই লাইনে build মেথড লেখা হয়েছে, যা Flutter এপ্লিকেশনের UI বিল্ড করতে ব্যবহার হয়।
    final theme = Theme.of(
        context); // এই লাইনে Theme.of(context) ব্যবহৃত হয়েছে যাতে theme নামে একটি থিম অবজেক্ট প্রাপ্ত হয়ে থাকে।
    final style = theme.textTheme.displayMedium!.copyWith(
      // এই লাইনে theme.textTheme.displayMedium হলো থিমের টেক্সট স্টাইলের একটি মাধ্যম বাছাই করা হয় এবং এটির কপি তৈরি করা হয় copyWith মেথড ব্যবহার করে।
      color: theme.colorScheme
          .onPrimary, // এটির লেবেল কালার ঠিক করা হয় theme.colorScheme.onPrimary দিয়ে।
    );

    return Card(
      // এই লাইনে একটি Card উইজেট রিটার্ন করা হয়েছে, যা একটি বড় কার্ড তৈরি করে।
      color: theme.colorScheme
          .primary, // কার্ডে থিমের প্রাথমিক রঙ theme.colorScheme.primary দিয়ে সেট করা হয়েছে।
      child: Padding(
        // কার্ডের ভিতরে Padding উইজেট ব্যবহৃত হয়েছে যাতে কার্ডের ভিতরের কন্টেন্টে একটি প্যাডিং থাকে।
        padding: const EdgeInsets.all(20), //
        child: Text(
          // প্যাডিংের মধ্যে একটি টেক্সট উইজেট আছে
          pair.asLowerCase, // যা pair.asLowerCase দিয়ে সেট করা হয়েছে।
          style: style, // স্টাইল style দিয়ে সেট করা হয়েছে।
          semanticsLabel:
              "${pair.first} ${pair.second}", // semanticsLabel প্যারামিটারে একটি লেবেল দেওয়া হয়েছে যাতে এটি সেমান্টিক্স এপিআই দ্বারা ব্যবহৃত হতে পারে।
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  // এই কোডে FavoritesPage নামে একটি Flutter স্টেটলেস উইজেট তৈরি করা হয়েছে, যা একটি প্রিয় আইটেমের তালিকা প্রদর্শন করে।
  @override
  Widget build(BuildContext context) {
    // এই লাইনে build মেথড লেখা হয়েছে, যা Flutter এপ্লিকেশনের UI বিল্ড করতে ব্যবহার হয়।
    var appState = context.watch<
        MyAppState>(); // এই লাইনে context.watch ব্যবহৃত হয়েছে যাতে MyAppState ক্লাসের অবজেক্টের একটি রেফারেন্স প্রাপ্ত হয়। এটি স্টেট পরিবর্তন হলে উইজেটটি পুনরায় রেবিল্ড হতে পারে।

    if (appState.favorites.isEmpty) {
      //এই লাইনে, যদি appState অবজেক্টের favorites লিস্ট খালি হয় ।
      return Center(
        //
        child: Text(
            'No favorites yet.'), // একটি মেসেজ দেখানো হয় যে "কোনো প্রিয়শ্রেণী এখনো নেই"।
      );
    }

    return ListView(
      // এই লাইনে একটি ListView উইজেট হয়েছে, যা একটি স্ক্রোলযোগ্য তালিকা প্রদর্শন করে।
      children: [
        //
        Padding(
          // এই লাইনে Padding উইজেট ব্যবহৃত হয়েছে তাদের দুইটি বৃহত্তর উইজেটের মাঝে একটি প্যাডিং যোগ করতে।
          padding: const EdgeInsets.all(20), //
          child: Text(
              'You have ' // এই লাইনে ব্যবহারকারীকে তাদের প্রিয়শ্রেণী সংখ্যা দেখানো হয়েছে।
              '${appState.favorites.length} favorites:'), // এটি appState.favorites.length দিয়ে প্রাপ্ত করা হয়।
        ),
        for (var pair in appState
            .favorites) // এই লাইনে appState.favorites লিস্টে থাকা প্রিয়শ্রেণীগুলির জন্য একটি for লুপ চালানো হয়।
          ListTile(
            // যা ListTile উইজেট দিয়ে প্রতি প্রিয়শ্রেণীকে একটি লিস্ট আইটেম হিসেবে প্রদর্শন করে।
            leading: Icon(Icons
                .favorite), // এই লাইনে প্রতিটি ListTile এর আগে একটি হৃদয়বৃত্তি আইকন (Icon(Icons.favorite)) প্রদর্শন করা হয়েছে।
            title: Text(pair
                .asLowerCase), // এই লাইনে প্রতিটি ListTile এর টাইটেলে প্রিয়শ্রেণীর লেখা প্রদর্শন করা হয়েছে, যা pair.asLowerCase দিয়ে প্রাপ্ত করা হয়েছে।
          ),
      ],
    );
  }
}
