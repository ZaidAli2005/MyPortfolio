import 'package:flutter/material.dart';
import 'package:myportfolio/models/experience.dart';
import 'package:myportfolio/models/profile.dart';
import 'package:myportfolio/models/skill.dart';
import 'package:myportfolio/models/social_link.dart';

const String profileImageUrl =
    'https://image2url.com/r2/default/images/1770277968459-d870b64d-a466-4d9b-a62e-f8b6eaa35813.jpeg';

class ProfileData {
  static const Profile profile = Profile(
    name: 'Zaid Ali',
    role: 'Mobile Application Developer',
    shortBio:
        'I build polished mobile experiences with Flutter and SwiftUI, backed by Firebase and Supabase.',
    bio:
        'I focus on crafting mobile products that feel fast, accessible, and delightful. My work blends Flutter and iOS engineering (Swift/SwiftUI) with Firebase, Supabase, and REST APIs to ship reliable, scalable apps. I enjoy collaborating end-to-end, from discovery to release, and translating Figma designs into high-impact experiences.',
    location: 'Gujranwala, Pakistan',
    email: 'zaidali786908@gmail.com',
    phone: '0324-6182942',
    website: 'https://tyrosoft.com/',
    cvUrl: 'https://example.com/cv.pdf',
    imageUrl: profileImageUrl,
  );

  static final List<SocialLink> socialLinks = [
    const SocialLink(
      label: 'LinkedIn',
      url: 'https://linkedin.com/in/yourprofile',
      icon: Icons.business,
    ),
    const SocialLink(
      label: 'GitHub',
      url: 'https://github.com/',
      icon: Icons.code,
    ),
    const SocialLink(
      label: 'Upwork',
      url: 'https://www.upwork.com/nx/find-work/best-matches',
      icon: Icons.palette_outlined,
    ),
    const SocialLink(
      label: 'Email',
      url: 'zaidali786908@gmail.com',
      icon: Icons.mail_outline,
    ),
  ];

  static final List<Skill> skills = [
    const Skill(
      name: 'Flutter',
      level: 0.92,
      category: 'Mobile',
      icon: Icons.flutter_dash,
    ),
    const Skill(
      name: 'SwiftUI',
      level: 0.83,
      category: 'IOS',
      icon: Icons.layers_outlined,
    ),
    const Skill(
      name: 'Swift',
      level: 0.82,
      category: 'IOS',
      icon: Icons.layers_outlined,
    ),
    const Skill(name: 'Dart', level: 0.9, category: 'Mobile', icon: Icons.code),
    const Skill(
      name: 'Firebase',
      level: 0.85,
      category: 'Backend',
      icon: Icons.cloud,
    ),
    const Skill(
      name: 'Supabase',
      level: 0.8,
      category: 'Backend',
      icon: Icons.storage_outlined,
    ),
    const Skill(
      name: 'REST APIs',
      level: 0.88,
      category: 'Backend',
      icon: Icons.api,
    ),
    const Skill(
      name: 'Figma',
      level: 0.78,
      category: 'Design',
      icon: Icons.design_services,
    ),
    const Skill(
      name: 'State Management',
      level: 0.86,
      category: 'Mobile',
      icon: Icons.account_tree_outlined,
    ),
    const Skill(
      name: 'Testing',
      level: 0.76,
      category: 'Quality',
      icon: Icons.rule_folder_outlined,
    ),
    const Skill(
      name: 'CI/CD',
      level: 0.72,
      category: 'Quality',
      icon: Icons.sync_alt,
    ),
    const Skill(
      name: 'Analytics',
      level: 0.7,
      category: 'Product',
      icon: Icons.analytics_outlined,
    ),
    const Skill(
      name: 'Product Strategy',
      level: 0.74,
      category: 'Product',
      icon: Icons.lightbulb_outline,
    ),
    const Skill(
      name: 'Agile Delivery',
      level: 0.8,
      category: 'Product',
      icon: Icons.event_available,
    ),
  ];

  static final List<Experience> experiences = [
    const Experience(
      title: 'Flutter & SwiftUI Developer',
      company: 'Freelance',
      period: '2023 - Present',
      location: 'Remote',
      description:
          'Developing cross-platform mobile applications using Flutter and native iOS solutions with SwiftUI.',
      highlights: [
        'Built 10+ production apps with Flutter, implementing clean architecture and state management solutions.',
        'Developed native iOS applications using SwiftUI and Swift, focusing on performance and smooth animations.',
        'Integrated Firebase and Supabase for authentication, data storage, and backend logic.',
        'Designed and implemented responsive UIs that work across multiple device sizes and platforms.',
      ],
      skills: [
        'Flutter',
        'Dart',
        'SwiftUI',
        'Swift',
        'Firebase',
        'Supabase',
        'REST APIs',
        'Figma',
      ],
    ),
    const Experience(
      title: 'Mobile App Developer',
      company: 'TechStart Inc.',
      period: '2022 - 2023',
      location: 'Remote',
      description:
          'Developed and maintained mobile applications for various clients, focusing on cross-platform solutions.',
      highlights: [
        'Created a social media app using Flutter with Firebase backend, handling real-time updates and media sharing.',
        'Integrated Supabase for database management, storage, and authentication in multiple projects.',
        'Collaborated with designers to implement custom UI/UX from Figma designs with high fidelity.',
        'Optimized app performance, reducing load times by 40% through code optimization and caching strategies.',
      ],
      skills: [
        'Flutter',
        'Firebase',
        'Supabase',
        'Dart',
        'Figma',
        'REST APIs',
      ],
    ),
    const Experience(
      title: 'iOS Developer Intern',
      company: 'AppWorks Studio',
      period: '2021 - 2022',
      location: 'Karachi, Pakistan',
      description:
          'Worked on developing and maintaining iOS applications using Swift and SwiftUI.',
      highlights: [
        'Assisted in developing and shipping 3+ iOS applications to the App Store.',
        'Implemented modern iOS design patterns (MVVM, Coordinator) and SwiftUI best practices.',
        'Worked with Core Data for local storage and RESTful APIs for data synchronization.',
        'Participated in code reviews and contributed to improving code quality and app performance.',
      ],
      skills: ['Swift', 'SwiftUI', 'UIKit', 'Core Data', 'REST APIs', 'Git'],
    ),
  ];
}
