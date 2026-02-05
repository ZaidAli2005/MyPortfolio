import 'dart:math';

import 'package:myportfolio/data/project_data.dart';
import 'package:myportfolio/models/project.dart';

class ProjectStreamService {
  static Stream<List<Project>> watchProjects() async* {
    final baseProjects = ProjectData.projects;
    var tick = 0;
    while (true) {
      final updated = <Project>[];
      for (var i = 0; i < baseProjects.length; i++) {
        final project = baseProjects[i];
        final pulse = (sin((tick + i) * 0.6) + 1) / 2;
        final progress =
            (project.progress + (pulse * 0.06)).clamp(0.05, 0.98);

        final status = progress > 0.9
            ? ProjectStatus.shipping
            : progress > 0.75
                ? ProjectStatus.testing
                : progress > 0.55
                    ? ProjectStatus.building
                    : ProjectStatus.discovery;

        updated.add(
          project.copyWith(
            progress: progress,
            status: status,
            lastUpdated: DateTime.now(),
          ),
        );
      }

      yield updated;
      await Future.delayed(const Duration(seconds: 3));
      tick += 1;
    }
  }
}
