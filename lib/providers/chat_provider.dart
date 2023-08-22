import 'package:flutter/material.dart';
import 'package:yes_no_app/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/models/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya has regresaste del trabajo?', fromWho: FromWho.me),
  ];

  final scrollController = ScrollController();

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    if (text.endsWith('?') && (text.contains('?'))) {
      herReplay();
    }

    notifyListeners();
    moveScrollToLastMessage();
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToLastMessage();
  }

  Future<void> moveScrollToLastMessage() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent,

        // т.е иди как максимум скролл позволяет
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear);
  }
}
