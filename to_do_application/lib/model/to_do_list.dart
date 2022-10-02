class Task {
  int taskId;
  String day;
  DateTime dateTime;
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.taskId,
      required this.day,
      required this.dateTime,
      required this.title,
      required this.description,
      this.isCompleted = false});

  factory Task.empty() => Task(
      taskId: DateTime.now().millisecondsSinceEpoch,
      dateTime: DateTime.now(),
      day: '',
      description: '',
      title: '',
      isCompleted: false);

  Task.fromJson(Map<String, dynamic> json)
      : taskId = json['taskId'],
        dateTime = json['dateTime'],
        day = json['day'],
        description = json['description'],
        isCompleted = json['isCompleted'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'datetime': dateTime,
        'day': day,
        'description': description,
        'isCompleted': isCompleted,
        'title': title,
      };

  @override
  String toString() {
    return "Task{title:$title, description:$description, date:$dateTime}";
  }
}
