import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myportfolio/core/app_theme.dart';
import 'package:myportfolio/screens/cv_screen.dart';
import 'package:myportfolio/screens/experience_screen.dart';
import 'package:myportfolio/screens/home_screen.dart';
import 'package:myportfolio/screens/profile_screen.dart';
import 'package:myportfolio/screens/projects_screen.dart';
import 'package:myportfolio/screens/skills_screen.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPortfolio',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomeShell(),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.active = false});

  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final inactiveColor = theme.colorScheme.onSurfaceVariant;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: active
            ? primary.withValues(alpha: 0.18)
            : theme.colorScheme.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: active ? primary.withValues(alpha: 0.35) : Colors.transparent,
          width: 1.2,
        ),
      ),
      child: Icon(icon, color: active ? primary : inactiveColor, size: 24),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const List<String> _titles = [
    'Home',
    'Skills',
    'Projects',
    'Experience',
    'Profile',
  ];

  void _openCv() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CvScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: _GlassNavigationBar(
        child: NavigationBar(
          selectedIndex: _index,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          height: 76,
          destinations: [
            NavigationDestination(
              icon: const _NavIcon(icon: Icons.home_outlined),
              selectedIcon: const _NavIcon(icon: Icons.home, active: true),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const _NavIcon(icon: Icons.auto_graph_outlined),
              selectedIcon: const _NavIcon(
                icon: Icons.auto_graph,
                active: true,
              ),
              label: 'Skills',
            ),
            NavigationDestination(
              icon: const _NavIcon(icon: Icons.work_outline),
              selectedIcon: const _NavIcon(icon: Icons.work, active: true),
              label: 'Projects',
            ),
            NavigationDestination(
              icon: const _NavIcon(icon: Icons.timeline_outlined),
              selectedIcon: const _NavIcon(icon: Icons.timeline, active: true),
              label: 'Experience',
            ),
            NavigationDestination(
              icon: const _NavIcon(icon: Icons.person_outline),
              selectedIcon: const _NavIcon(icon: Icons.person, active: true),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      ),
    );
  }

  List<Widget> get _pages => [
        HomeScreen(
          onViewCv: _openCv,
          onViewProfile: () {
            setState(() {
              _index = 4;
            });
          },
        ),
        const SkillsScreen(),
        const ProjectsScreen(),
        const ExperienceScreen(),
        const ProfileScreen(),
      ];
}

class _GlassNavigationBar extends StatelessWidget {
  const _GlassNavigationBar({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final glassColor = theme.colorScheme.surface.withValues(alpha: 0.72);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: glassColor,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.4,
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
