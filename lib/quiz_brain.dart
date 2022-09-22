import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('<<Welcome>> translates to <<Bienvenue>> ?', true),
    Question('And <<To translate>>, is.... <<traduire>> ?',true),
    Question('<<Son>> means <<Fille>> ?', false),
    Question('<<Garden>> in French is <<Jardin>> ? ', true),
    Question('<<French>> is <<French>>, but what is <<French>> in French? <<Franca>>, right?', false),
    Question('What about <<Arabic>>? It is <<Arabe>>! Vrai ou faux ?', true),
    Question('To say, <<I am Srishti>>, I would say <<Je sais Srishti>> ! ', false),
    Question('Say <<One, two, three...>>! <<Un, dos, tres>>! Est-ce que c\'est vrai ?', false),
    Question('<<City of love>>? You mean <<La ville de la merde?>> ?', false),
    Question('Okay, okay, one more try! <<City of love>>, as in <<La ville de l\'amour>> ?', true),
    Question('Say <<I don\'t know>>, but like a Parisian! <<Chez pas>>! ?', true),
    Question('<<Chez pas>> isn\'t slang! ?', false),
    Question('<<Singe>> is a fruit! ', false),
    Question(' So...... <<Alors>> and <<Donc>> are synonymes?', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}