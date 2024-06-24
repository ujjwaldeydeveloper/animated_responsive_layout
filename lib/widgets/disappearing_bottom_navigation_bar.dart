import 'package:animated_responsive_layout/transitions/bottom_bar_transition.dart';
import 'package:flutter/material.dart';

import '../animations.dart';
import '../destinations.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar({
    super.key,
    //animation
    required this.barAnimation,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final BarAnimation barAnimation;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    // wrapping with BottomBarTransition
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: Colors.white,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations.map<NavigationDestination>((d) {
          return NavigationDestination(
            icon: Icon(d.icon),
            label: d.label,
          );
        }).toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
