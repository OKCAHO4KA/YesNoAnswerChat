import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/models/message.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
import 'package:yes_no_app/widgets/her_message_bubble.dart';
import 'package:yes_no_app/widgets/my_message_bubble.dart';
import 'package:yes_no_app/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.wired.com/photos/593261cab8eb31692072f129/master/w_2560%2Cc_limit/85120553.jpg')),
          ),
          title: const Text('Mi Amigo'),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.scrollController,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, i) {
                      final message = chatProvider.messages[i];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            MesageFieldBox(onValue: (value) => chatProvider.sendMessage(value))
          ],
        ),
      ),
    );
  }
}
