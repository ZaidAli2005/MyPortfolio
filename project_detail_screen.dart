import 'package:flutter/material.dart';
import 'package:myportfolio/core/app_spacing.dart';
import 'package:myportfolio/models/project.dart';
import 'package:myportfolio/services/link_launcher.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void openImage(ImageProvider image, String heroTag) {
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => _ImagePreviewScreen(
            image: image,
            heroTag: heroTag,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(project.name)),
      body: SingleChildScrollView(
        padding: AppSpacing.page,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => openImage(
                project.imageProvider,
                'project-${project.id}-cover',
              ),
              child: Hero(
                tag: 'project-${project.id}-cover',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      image: project.imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            if (project.gallery != null && project.gallery!.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.gallery!.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final imageUrl = project.gallery![index];
                    final image = project.imageProviderFor(imageUrl);
                    final heroTag = 'project-${project.id}-gallery-$index';
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: GestureDetector(
                        onTap: () => openImage(image, heroTag),
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Hero(
                            tag: heroTag,
                            child: Image(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            Text(
              project.name,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(project.description),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: project.status.color.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    project.status.label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: project.status.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Updated ${project.lastUpdated.toLocal().toString().split(' ').first}',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            LinearProgressIndicator(
              value: project.progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(999),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text('${(project.progress * 100).round()}% Complete'),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Tech Stack',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children:
                  project.techStack.map((tech) => Chip(label: Text(tech))).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                if (project.repoUrl != null)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          LinkLauncher.open(context, project.repoUrl!),
                      icon: const Icon(Icons.code),
                      label: const Text('View Repo'),
                    ),
                  ),
                if (project.repoUrl != null && project.liveUrl != null)
                  const SizedBox(width: AppSpacing.sm),
                if (project.liveUrl != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          LinkLauncher.open(context, project.liveUrl!),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Live Preview'),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePreviewScreen extends StatelessWidget {
  const _ImagePreviewScreen({
    required this.image,
    required this.heroTag,
  });

  final ImageProvider image;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: InteractiveViewer(
            minScale: 0.9,
            maxScale: 4,
            child: Image(image: image, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
