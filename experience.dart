// In lib/models/experience.dart
class Experience {
  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.highlights,
    this.skills = const [], // Added skills field with default empty list
  });

  final String title;
  final String company;
  final String period;
  final String location;
  final String description;
  final List<String> highlights;
  final List<String> skills; // Added skills field
}