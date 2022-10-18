import 'dart:convert';

class User {
  int? id;
  String username;
  String? email;
  String? password;

  User({
    this.id,
    required this.username,
    this.email,
    this.password,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'username': username,
        'email': email,
        'password': password,
      };

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] != null ? map['id'] as int : null,
        username: map['username'] as String,
        email: map['email'] != null ? map['email'] as String : null,
        password: map['password'] != null ? map['password'] as String : null,
      );

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(id: $id, username: $username, email: $email, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode =>
      id.hashCode ^ username.hashCode ^ email.hashCode ^ password.hashCode;
}
