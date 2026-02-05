import 'package:flutter/material.dart';

enum ProjectStatus { discovery, building, testing, shipping, paused }

extension ProjectStatusX on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.discovery:
        return 'Discovery';
      case ProjectStatus.building:
        return 'In Progress';
      case ProjectStatus.testing:
        return 'Testing';
      case ProjectStatus.shipping:
        return 'Ready for Release';
      case ProjectStatus.paused:
        return 'Paused';
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.discovery:
        return const Color(0xFF5B8DEF);
      case ProjectStatus.building:
        return const Color(0xFF00A3A5);
      case ProjectStatus.testing:
        return const Color(0xFFFFB300);
      case ProjectStatus.shipping:
        return const Color(0xFF2E7D32);
      case ProjectStatus.paused:
        return const Color(0xFF757575);
    }
  }
}

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.techStack,
    required this.imageUrl,
    required this.status,
    required this.progress,
    required this.lastUpdated,
    this.gallery,
    this.repoUrl,
    this.liveUrl,
  });

  final String id;
  final String name;
  final String description;
  final List<String> techStack;
  final String imageUrl;
  final ProjectStatus status;
  final double progress;
  final DateTime lastUpdated;
  final List<String>? gallery;
  final String? repoUrl;
  final String? liveUrl;

  ImageProvider get imageProvider {
    return imageProviderFor(imageUrl);
  }

  ImageProvider imageProviderFor(String url) {
    if (url.startsWith('assets/')) {
      return AssetImage(url);
    }
    return NetworkImage(url);
  }

  Project copyWith({
    ProjectStatus? status,
    double? progress,
    DateTime? lastUpdated,
  }) {
    return Project(
      id: id,
      name: name,
      description: description,
      techStack: techStack,
      imageUrl: imageUrl,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      gallery: gallery,
      repoUrl: repoUrl,
      liveUrl: liveUrl,
    );
  }
}
