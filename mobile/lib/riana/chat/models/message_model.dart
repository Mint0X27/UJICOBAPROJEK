class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String message;
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'].toString(),
      chatId: json['chat_id'].toString(),
      senderId: json['sender_id'].toString(),
      message: json['message'].toString(),
      createdAt: DateTime.parse(json['created_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'sender_id': senderId,
      'message': message,
      'created_at': createdAt.toIso8601String(),
    };
  }
}