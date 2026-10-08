import 'package:flutter/material.dart';
import 'models/message_model.dart';

class AdminChatDetailPage extends StatefulWidget {
  final String nama;
  final String kost;
  final String kamar;
  final String pesanAwal;

  const AdminChatDetailPage({
    super.key,
    required this.nama,
    required this.kost,
    required this.kamar,
    required this.pesanAwal,
  });

  @override
  State<AdminChatDetailPage> createState() => _AdminChatDetailPageState();
}

class _AdminChatDetailPageState extends State<AdminChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late List<MessageModel> messages;

  @override
  void initState() {
    super.initState();

  messages = [
    MessageModel(
      id: 'message-1',
      chatId: 'chat-1',
      senderId: 'student',
      message: widget.pesanAwal,
      createdAt: DateTime.now().subtract(
        const Duration(minutes: 10),
    ),
  ),
    MessageModel(
      id: 'message-2',
      chatId: 'chat-1',
      senderId: 'admin',
      message:
          'Halo, iya kak. Untuk saat ini kamar tersebut masih tersedia.',
      createdAt: DateTime.now().subtract(
        const Duration(minutes: 8),
      ),
    ),
    MessageModel(
      id: 'message-3',
      chatId: 'chat-1',
      senderId: 'student',
      message:
          'Oh baik kak. Kalau boleh tahu fasilitasnya apa saja?',
      createdAt: DateTime.now().subtract(
        const Duration(minutes: 6),
      ),
    ),
  ];
  }

  void _sendMessage() {
  final text = _messageController.text.trim();

  if (text.isEmpty) return;

  setState(() {
    messages.add(
      MessageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        chatId: 'chat-1',
        senderId: 'admin',
        message: text,
        createdAt: DateTime.now(),
      ),
    );
  });

  _messageController.clear();

  _scrollToBottom();
}

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        titleSpacing: 0,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nama,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${widget.kost} • ${widget.kamar}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            color: const Color(0xFFF0F6FF),
            child: const Text(
              'Percakapan dengan calon penyewa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(
                16,
                20,
                16,
                20,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                final bool isAdmin = message.senderId == 'admin';

                final String time =
                    '${message.createdAt.hour.toString().padLeft(2, '0')}.'
                    '${message.createdAt.minute.toString().padLeft(2, '0')}';

                return _buildMessageBubble(
                  message.message,
                  time,
                  isAdmin,
              );

              },
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(
              12,
              10,
              12,
              12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: 'Tulis pesan...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF5F6F8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Material(
                    color: const Color(0xFF2196F3),
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: _sendMessage,
                      child: const SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
    String message,
    String time,
    bool isAdmin,
  ) {
    return Align(
      alignment:
          isAdmin ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 310,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isAdmin
              ? const Color(0xFF2196F3)
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(
              isAdmin ? 16 : 4,
            ),
            bottomRight: Radius.circular(
              isAdmin ? 4 : 16,
            ),
          ),
          border: !isAdmin
              ? Border.all(
                  color: const Color(0xFFE5E7EB),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment:
              isAdmin
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isAdmin
                    ? Colors.white
                    : Colors.black87,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: isAdmin
                    ? Colors.white70
                    : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}