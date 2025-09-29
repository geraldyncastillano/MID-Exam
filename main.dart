import 'package:flutter/material.dart';

void main() {
  runApp(const GRCApp());
}

class GRCApp extends StatelessWidget {
  const GRCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Global Reciprocal Colleges",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

// Home Page with Bottom Navigation
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const CCSPage(),
    const EventsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        titleSpacing: 0,
        title: Row(
          children: [
            // Circle logo slot (upper-left)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage("https://yt3.googleusercontent.com/ytc/AIdro_kQFQKAvUvEKH9qCIpryzJgcPOvD2Sqa8oKy6LZqALHnw=s900-c-k-c0x00ffffff-no-rj"),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Global Reciprocal Colleges",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red[800],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Academics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Events",
          ),
        ],
      ),
    );
  }
}

// Page Contents

// Home Page Content with gradient + wave
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF44336), // red
                Color(0xFFe53935), // light red
              ],
            ),
          ),
        ),
        // Centered text
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "GLOBAL RECIPROCAL COLLEGES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "TOUCHING HEARTS, RENEWING MINDS, TRANSFORMING LIVES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        // Wavy bottom design
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 120,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

// CCS Page with list of courses
class CCSPage extends StatelessWidget {
  const CCSPage({super.key});

  final List<String> courses = const [
    "Bachelor of Science in Information Technology (BSIT)",
    "College of Computer Studies (CCS)",
    "Bachelor of Science in Accountancy (BSA)",
    "College of Business Administration and Entrepreneurship (CBAE)",
    "College of Education (BSED)",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.book, color: Colors.red),
            title: Text(courses[index]),
          ),
        );
      },
    );
  }
}

// Events Page with sample events
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  final List<String> events = const [
    "GRC CAMP 2024 @ HIGHLANDS IBA, ZAMBALES",
    "Food Bazaar - July 21",
    "Sports Fest – March 23 ",
    "Foundation Day – October 15",
    "IT Week – December 10"
    "Educ Week - November 10",
    "Christmas Party – December 20",
    "Graduation Day - July 24",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.event, color: Colors.red),
            title: Text(events[index]),
          ),
        );
      },
    );
  }
}

// Wave Shape
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


