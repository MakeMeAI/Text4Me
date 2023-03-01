import 'package:flutter/material.dart';
import "page2.dart" as page2;
import "sidebar.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // App Theme (1)
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: const PageViewer(),
    );
  }
}



class PageViewer extends StatefulWidget {
  const PageViewer({super.key});

  @override
  State<PageViewer> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewer> {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          )
      ),
      child: PageView(
      controller: _controller,
      children: [
        _MyHomePageState(),
         page2.Page2(),
      ],

    ),
    );
  }
}



class _MyHomePageState extends StatelessWidget {
  int _selectedIndex = 0;

  //FIGURE OUT WHY WRONG
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Rerunning build (4)
    return Scaffold(
      drawer: sidebar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Welcome back, NAME"),
        backgroundColor: Color(0x4400000000),
        elevation: 0,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container (
        ),
      ),

      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color(0x4400000000),
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Calls',
            label: "Home",
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            tooltip: 'Camera',
            label: "page 2",
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            tooltip: 'Chats',
            label: "page 3",
            //backgroundColor: Colors.red,
          ),
        ],
        //currentIndex: _selectedIndex, ---- add back in - ali
        //ADD BACK
        //onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
