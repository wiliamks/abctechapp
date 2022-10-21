import 'dart:convert';

class ErrorResponse {
  String? message;
  String? description;
  DateTime? timestamp;
  int? statusCode;

  ErrorResponse({
    this.message,
    this.description,
    this.timestamp,
    this.statusCode,
  });

  ErrorResponse copyWith({
    String? message,
    String? description,
    DateTime? timestamp,
    int? statusCode,
  }) =>
      ErrorResponse(
        message: message ?? this.message,
        description: description ?? this.description,
        timestamp: timestamp ?? this.timestamp,
        statusCode: statusCode ?? this.statusCode,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'message': message,
        'description': description,
        'timestamp': timestamp?.millisecondsSinceEpoch,
        'StatusCode': statusCode,
      };

  factory ErrorResponse.fromMap(Map<String, dynamic> map) => ErrorResponse(
        message: map['message'] != null ? map['message'] as String : null,
        description:
            map['description'] != null ? map['description'] as String : null,
        timestamp: map['timestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int)
            : null,
        statusCode: map['StatusCode'] != null ? map['StatusCode'] as int : null,
      );

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ErrorResponse(message: $message, description: $description, timestamp: $timestamp, StatusCode: $statusCode)';

  @override
  bool operator ==(covariant ErrorResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.description == description &&
        other.timestamp == timestamp &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode =>
      message.hashCode ^
      description.hashCode ^
      timestamp.hashCode ^
      statusCode.hashCode;
}
