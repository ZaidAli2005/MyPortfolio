import 'package:flutter/material.dart';
import 'package:myportfolio/core/app_spacing.dart';
import 'package:myportfolio/models/project.dart';
import 'package:myportfolio/screens/project_detail_screen.dart';
import 'package:myportfolio/services/project_stream_service.dart';
import 'package:myportfolio/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Project>>(
      stream: ProjectStreamService.watchProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final projects = snapshot.data ?? [];
        return ListView.separated(
          padding: AppSpacing.page,
          itemCount: projects.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            final project = projects[index];
            return ProjectCard(
              project: project,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProjectDetailScreen(project: project),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
