import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  bool submitted = false;
  int? selectedOptionIndex;

  QuizQuestion({required this.question, required this.options});
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
    ), QuizQuestion(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
    ), QuizQuestion(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
    ), QuizQuestion(
      question: "What is the capital of France?",
      options: ["Berlin", "Madrid", "Paris", "Rome"],
    ),
    QuizQuestion(
      question: "What is 2 + 2?",
      options: ["3", "4", "5", "6"],
    ),
    // Add more questions here
  ];

  void _submitAnswer(int questionIndex) {
    setState(() {
      questions[questionIndex].submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 26, 43),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 6, 26, 43),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Task",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5.0,left: 7,right: 7), // Adjust bottom padding here
        child: CheckboxTheme(
          data: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.blue),
            checkColor: MaterialStateProperty.all(Colors.white),
          ),
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 80), // Add bottom padding to ListView
            itemCount: questions.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              final question = questions[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.indigo.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.question,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4,
                          crossAxisSpacing: 35,
                        ),
                        itemCount: question.options.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, optionIndex) {
                          return Row(
                            children: [
                              Checkbox(
                                value: question.selectedOptionIndex == optionIndex,
                                onChanged: question.submitted
                                    ? null
                                    : (value) {
                                  setState(() {
                                    question.selectedOptionIndex = optionIndex;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  question.options[optionIndex],
                                  style: TextStyle(
                                    color: question.submitted &&
                                        optionIndex == question.selectedOptionIndex
                                        ? Colors.green
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: (question.selectedOptionIndex == null || question.submitted)
                            ? null
                            : () => _submitAnswer(index),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide.none,
                          ),
                          elevation: 0,
                          backgroundColor: question.submitted ? Colors.grey : Colors.blue,
                        ),
                        child: Text(
                          question.submitted ? 'Submitted' : 'Submit',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
