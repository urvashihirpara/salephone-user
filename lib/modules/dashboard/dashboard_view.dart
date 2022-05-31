import 'package:flutter/material.dart';
import 'package:salephone_user/controllers/general_controller.dart';
import 'package:salephone_user/utility/color_utility.dart';

import '../../common_view/common_widgets.dart';
import 'home/home_screen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  void _onItemTapped(int index) {
    GeneralController.to.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        bottomNavigation: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed, // Fixed
          currentIndex: GeneralController.to.selectedIndex.value, //New
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: whiteColor,
                size: 38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: whiteColor,
                size: 38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: whiteColor,
                size: 38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: whiteColor,
                size: 38,
              ),
              label: '',
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
          child: HomeScreen(),
        ));
  }
}
