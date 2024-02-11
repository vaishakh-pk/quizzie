// Model of questions to be displayed

class QuizQuestion
{
  const QuizQuestion(this.text,this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers()
  {
    //Creating a copy of list
    final shuffledList = List.of(answers);
    //shuffle the copy of list
    shuffledList.shuffle();
    return shuffledList;
  }
}