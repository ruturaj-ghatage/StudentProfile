import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_profile/screens/admin_screen.dart';
import 'package:student_profile/screens/dashboard.dart';
import 'package:student_profile/screens/login_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:student_profile/screens/main_screen.dart';
import 'package:student_profile/screens/profile_screen.dart';

final _auth = FirebaseAuth.instance;

// class Dashboard extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(80.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [

//             ElevatedButton(
//                 onPressed: () {
//                   print(kIsWeb);
//                 },
//                 child: Text('meh')),
//             Container(
//               child: ElevatedButton(
//                 child: Text('Sign out'),
//                 onPressed: () {
//                   _auth.signOut();
//                   Navigator.pushNamed(context, MainScreen.id);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

int pageIndex = 0;

class Scroller extends StatefulWidget {
  static String id = 'scroller';

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  PageController _pageController = PageController();

  List<Widget> pages = [
    ProfilePage(),
    DashBoard(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: gotoPage,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            label: 'dashboard',
          )
        ],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      pageIndex = page;
      // print(page);
    });
  }

  void gotoPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
