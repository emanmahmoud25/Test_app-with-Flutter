import 'Questions.dart';

//Abstraction
class AppBrain {
  int _questionnumber = 0;
  List<Questionn> _questiongroup = [
    Questionn(
        t: "The number of planets in the solar system is 8 planets",
        i: 'images/pic1.png',
        a: true),
    Questionn(t: 'Cats are carnivores', i: 'images/pic2.png', a: true),
    Questionn(
        t: 'China is located in the African continent',
        i: 'images/pic3.jpeg',
        a: false),
    Questionn(
        t: 'The Earth is flat, not spherical', i: 'images/pic4.png', a: false),
    Questionn(t: 'Animals do not feel pain', i: 'images/pic5.jpg', a: false),
    Questionn(
        t: 'Cairo is the capital of Egypt', i: 'images/pic6.jpeg', a: true),
  ];
  //to avoid errror in last question
  void nextquestion() {
    if (_questionnumber < _questiongroup.length - 1) {
      _questionnumber++;
    }
  }

  // Encapsulation
  String getquestiontext() {
    return _questiongroup[_questionnumber].questiontext;
  }

  String getquestionimage() {
    return _questiongroup[_questionnumber].questionimage;
  }

  bool getquestionanswer() {
    return _questiongroup[_questionnumber].questionanswer;
  }

  bool isfinished() {
    if (_questionnumber >= _questiongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnumber = 0;
  }
}
