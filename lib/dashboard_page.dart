import 'package:flutter/material.dart';
import 'package:tugas_uts/main.dart';
import 'package:tugas_uts/note_page.dart';
import 'package:tugas_uts/profile_page.dart';
import 'package:tugas_uts/task_page.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primaryColor: Colors.orange, // Set primary color to orange
        secondaryHeaderColor: Colors.blue, // Set accent color to blue
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white70, // Set background color
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent, // Use your preferred color
                ),
                child: Center(
                  child: Text(
                    'EasyList',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Note',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotePage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Theme.of(context)
      //               .primaryColor, // Use primary color from theme
      //         ),
      //         child: Text(
      //           'EasyList',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Profile',
      //           style: TextStyle(
      //             fontSize: 18,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => ProfilePage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Note',
      //           style: TextStyle(
      //             fontSize: 18,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => NotePage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Tasks',
      //           style: TextStyle(
      //             fontSize: 18,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => TaskPage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Logout',
      //           style: TextStyle(
      //             fontSize: 18,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => HomePage()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pp.jpg'),
                  radius: 50,
                ),
                SizedBox(width: 20),
                Text(
                  'Ipung Nanda',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                DashboardItem(title: 'Note', count: 0),
                DashboardItem(title: 'Tasks ', count: 0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final int count;

  DashboardItem({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.grey[200], // Background color for the card
      child: InkWell(
        onTap: () {
          // Handle tap on the item
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .secondaryHeaderColor, // Use accent color from theme
                ),
              ),
              SizedBox(height: 10),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .primaryColor, // Use primary color from theme
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
