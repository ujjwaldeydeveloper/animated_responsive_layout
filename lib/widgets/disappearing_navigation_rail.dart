import 'package:flutter/material.dart';

import '../animations.dart';
import '../destinations.dart';
import '../transitions/nav_rail_transition.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail({
    super.key,
    //added animation
    required this.railAnimation,                      // Add this parameter
    required this.railFabAnimation, 
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  // animation
  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation; 
  //... 
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // wrapping with NavigationRailTransition
    return NavRailTransition(
      
      animation: railAnimation,
      backgroundColor: backgroundColor,

      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        leading: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              backgroundColor: colorScheme.tertiaryContainer,
              foregroundColor: colorScheme.onTertiaryContainer,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
        groupAlignment: -0.85,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}
