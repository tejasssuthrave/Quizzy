class Question{
  final String questionText;
  final List<Answer>  answersList;

  Question(this.questionText, this.answersList);


}
class Answer{
  final String answerText;
  final bool isCorrect;

   Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions()
{
  List<Question> list=[];
  list.add(
    Question("Who is the owner of flutter",
    [
      Answer("Nokia",false),
      Answer("samsung",false),
      Answer("google",true),
      Answer("apple",false),
    ],
    )
  );
  list.add(
      Question("Who owns flutter",
        [
          Answer("Nokia",false),
          Answer("samsung",false),
          Answer("google",true),
          Answer("apple",false),
        ],
      )
  );
  list.add(
      Question("YT is ___________ flatform",
        [
          Answer("music sharing",false),
          Answer("video sharing",false),
          Answer("both",false),
          Answer("all of the above",true),
        ],
      )
  );
  return list;
}