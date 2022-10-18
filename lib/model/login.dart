import 'dart:convert';

class Login {
  String input;
  String password;

  Login({
    required this.input,
    required this.password,
  });

  Login copyWith({
    String? input,
    String? password,
  }) =>
      Login(
        input: input ?? this.input,
        password: password ?? this.password,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'input': input,
        'password': password,
      };

  factory Login.fromMap(Map<String, dynamic> map) => Login(
        input: map['input'] as String,
        password: map['password'] as String,
      );

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) =>
      Login.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Login(input: $input, password: $password)';

  @override
  bool operator ==(covariant Login other) {
    if (identical(this, other)) return true;

    return other.input == input && other.password == password;
  }

  @override
  int get hashCode => input.hashCode ^ password.hashCode;
}
