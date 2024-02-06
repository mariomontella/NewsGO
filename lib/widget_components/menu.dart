import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'lib/assets/images/logodef.png',
                    width: 130,
                    height: 130,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Implement navigation to News page
              },
            ),
            ListTile(
              title: Text('Privacy Policy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Implement navigation to Privacy Policy page
              },
            ),
            ListTile(
              title: Text('test',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                // Implement navigation to Privacy Policy page
              },
            ),
          ],
        ),
      ),
    );
  }
}
