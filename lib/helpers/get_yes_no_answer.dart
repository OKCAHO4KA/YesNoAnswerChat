import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructura/yes_no_model.dart';
import 'package:yes_no_app/models/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(response.data);
    return
        // Message(
        //     text: yesNoModel.answer,
        //     fromWho: FromWho.hers,
        //     imageUrl: yesNoModel.image);

        yesNoModel.toMessageEntity();
  }
}
