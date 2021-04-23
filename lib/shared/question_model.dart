import 'dart:convert';
import 'answer_model.dart';


class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({required this.title, required this.awnsers})
      : assert(awnsers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awnsers: List<AwnserModel>.from(
          map['answers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
