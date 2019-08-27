import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocogo/models/quiz_model.dart';

class DatabaseClient {
  //Singleton
  DatabaseClient._privateConstructor();
  static final DatabaseClient instance = DatabaseClient._privateConstructor();
  final _db = Firestore.instance;

  Future<List<QuizModel>> getQuizs() async {
    List<QuizModel> quizs = List<QuizModel>();
    await _db.collection('quiz').getDocuments().then((docs) =>
        docs.documents.forEach((d) => quizs.add(QuizModel.fromMap(d.data))));
    return quizs;
  }
}
