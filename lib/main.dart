import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'config.dart';

void main() {
  Gemini.init(apiKey: apiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final gemini = Gemini.instance;
  var text = "";
  int currentPageIndex = 0;
  bool loading = false;
  submitGemini() {
    setState(() {
      text = "";
      loading = true;
    });
    gemini.text("how to recycle a television").then((value) {
      setState(() {
        text = text + (value?.output ?? "");
        print(text);
        loading = false;
      });
    })

        /// or value?.content?.parts?.last.text
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Eco Echo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
        backgroundColor: const Color.fromRGBO(191, 216, 175, 1),
      ),
      body: ListView(
        children: [
          TextButton(
            child: const Text("submit"),
            onPressed: () {
              submitGemini();
            },
          ),
          loading
              ? const CircularProgressIndicator()
              : Flex(
                  direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            print(index);
          });
        },
        height: 70,
        indicatorColor: const Color.fromRGBO(185, 200, 180, 1),
        backgroundColor: const Color.fromRGBO(
          225,
          240,
          218,
          1,
        ),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
