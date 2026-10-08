class ChatModel {
  final String id;
  final String studentId;
  final String adminId;
  final String kostId;
  final String? roomId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChatModel({
    required this.id,
    required this.studentId,
    required this.adminId,
    required this.kostId,
    this.roomId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'].toString(),
      studentId: json['student_id'].toString(),
      adminId: json['admin_id'].toString(),
      kostId: json['kost_id'].toString(),
      roomId: json['room_id']?.toString(),
      createdAt: DateTime.parse(
        json['created_at'].toString(),
      ),
      updatedAt: DateTime.parse(
        json['updated_at'].toString(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_id': studentId,
      'admin_id': adminId,
      'kost_id': kostId,
      'room_id': roomId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}