class School {
  final String id;
  final String name;
  final String email;
  final String location;
  School({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
  });
  factory School.fromMap(Map<String, dynamic> data, String documentId) {
    return School(
      id: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      location: data['location'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
    };
  }
}
