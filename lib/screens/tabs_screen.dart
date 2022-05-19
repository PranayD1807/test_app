import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_app/screens/history_screen.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/profile_screen.dart';
import 'package:test_app/screens/splash_screen.dart';
import 'package:test_app/screens/wrapper.dart';

// ignore: must_be_immutable
class TabScreen extends StatelessWidget {
  TabScreen({Key? key}) : super(key: key);

  // persistent
  final List<PersistentBottomNavBarItem> _perItens = [
    PersistentBottomNavBarItem(
      activeColorPrimary: const Color.fromRGBO(255, 72, 47, 1),
      activeColorSecondary: Colors.white,
      icon: const ImageIcon(
        AssetImage("assets/profile.png"),
        color: Colors.white,
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      title: ("Profile"),
    ),
    PersistentBottomNavBarItem(
      activeColorPrimary: const Color.fromRGBO(255, 72, 47, 1),
      activeColorSecondary: Colors.white,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      title: ("Count"),
    ),
    PersistentBottomNavBarItem(
      activeColorPrimary: const Color.fromRGBO(255, 72, 47, 1),
      activeColorSecondary: Colors.white,
      icon: const Icon(
        Icons.history,
        color: Colors.white,
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      title: ("History"),
    ),
  ];

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ProfileScreen(
        // Here backFn is used so that the back button works on other two pages
        backFn: () {
          _controller.jumpToTab(1);
        },
        logout: () {
          _controller.dispose();
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => SplashScreen(),
              ),
              (route) => false);
        },
      ),
      const HomeScreen(),
      HistoryScreen(
        backFn: () {
          _controller.jumpToTab(1);
        },
      ),
    ];

    // using persistent tab view
    return PersistentTabView(
      context,
      controller: _controller,
      screens: pages,
      items: _perItens,
      confineInSafeArea: true,
      navBarHeight: 75,

      backgroundColor:
          const Color.fromRGBO(250, 38, 9, 1), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style10, // Choose the nav bar style with this property.
    );
  }
}
