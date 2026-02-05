import 'package:myportfolio/models/project.dart';

class ProjectData {
  static final List<Project> projects = [
    Project(
      id: 'kidzcorner',
      name: 'KidzCorner',
      description:
          'An all-in-one childcare platform that streamlines daily reports, learning portfolios, attendance, parent communication, and billing for daycare centers.',
      techStack: [
        'Swift',
        'Firebase',
        'Kotlin',
        'APIs',
        'Figma',
      ],
      imageUrl: 'assets/kidzcorner/kidz2.webp',
      gallery: [
        'assets/kidzcorner/kidz1.webp',
        'assets/kidzcorner/kidz2.webp',
        'assets/kidzcorner/kidz3.webp',
        'assets/kidzcorner/kidz4.webp',
      ],
      status: ProjectStatus.building,
      progress: 0.76,
      lastUpdated: DateTime(2026, 1, 26),
    ),
    Project(
      id: 'gamma-iptv',
      name: 'GAMMA IPTV PLAYER',
      description:
          'The ultimate IPTV streaming app with playlist support, grouped channels, ad-free playback, custom EPG, and lightning-fast search.',
      techStack: [
        'Flutter',
        'IPTV',
        'ExoPlayer',
        'REST APIs',
        'Figma',
      ],
      imageUrl: 'assets/gamma/gama1.webp',
      gallery: [
        'assets/gamma/gama1.webp',
        'assets/gamma/gama2.webp',
        'assets/gamma/gama3.webp',
        'assets/gamma/gama4.webp',
        'assets/gamma/gama5.webp',
      ],
      status: ProjectStatus.shipping,
      progress: 1.0,
      lastUpdated: DateTime(2026, 1, 7),
    ),
    Project(
      id: 'living-bread-radio',
      name: 'Living Bread Radio',
      description:
          'A Catholic radio app streaming programming from EWTN, Ave Maria Radio, and local shows to support a New Evangelization.',
      techStack: [
        'Flutter',
        'Audio Streaming',
        'REST APIs',
        'Firebase',
        'Figma',
      ],
      imageUrl: 'assets/living_bread/living1.webp',
      gallery: [
        'assets/living_bread/living1.webp',
        'assets/living_bread/living2.webp',
        'assets/living_bread/living3.webp',
        'assets/living_bread/living4.webp',
        'assets/living_bread/living5.webp',
      ],
      status: ProjectStatus.shipping,
      progress: 1.0,
      lastUpdated: DateTime(2025, 11, 12),
    ),
  ];
}
