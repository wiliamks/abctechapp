import 'dart:convert';

class Assist {
  Assist({
      required this.id,
      required this.name,
      required this.description,
  });

  int id;
  String name;
  String description;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  factory Assist.fromMap(Map<String, dynamic> map) => Assist(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String);

  factory Assist.fromJson(String source) =>
      Assist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Assistance(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant Assist other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
