// ignore_for_file: library_private_types_in_public_api

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'faculty_page.dart';
import 'images_page.dart';
import 'newsfeed_page.dart';
import 'images_u.dart';
import 'images_v.dart';

class ConvexAppExample extends StatefulWidget {
  const ConvexAppExample({super.key});

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}

class _ConvexAppExampleState extends State<ConvexAppExample> {
  final TabStyle _tabStyle = TabStyle.reactCircle;
  Widget cen = const NewsfeedPage();
  void setty(int ci) {
    if (ci == 1) {
      cen = FacultyPage();
    } else if (ci == 2) {
      cen = ImagesView();
    } else {
      cen = const NewsfeedPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            // _buildStyleSelector(),
            Expanded(
              child: cen,
            ),
          ],
        ),
        // body: cen,
        bottomNavigationBar: ConvexAppBar.badge(
            // Optional badge argument: keys are tab indices, values can be
            // String, IconData, Color or Widget.
            const <int, dynamic>{1: ''},
            style: _tabStyle,
            items: const <TabItem>[
              TabItem(icon: Icons.newspaper, title: "feed"),
              TabItem(icon: Icons.person_pin, title: "faculty"),
              TabItem(icon: Icons.image, title: "events"),
            ],
            onTap: (int i) => setState(() {
                  setty(i);
                })),
      ),
    );
  }
}
