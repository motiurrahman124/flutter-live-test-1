void main() {
  List<Map<String, dynamic>> students = [

  {"name": "Alice", "scores": [85, 90, 78]},

  {"name": "Bob", "scores": [88, 76, 95]},

  {"name": "Charlie", "scores": [90, 92, 85]}

];

  Map<String, double> studentAverageScores = calculateAverage(students);
  Map<String, double> sortedAverageScores = sortAverages(studentAverageScores);

  print(sortedAverageScores);

}

Map<String, double> calculateAverage(List<Map<String, dynamic>> students) {

  Map<String, double> averages = {};

  for (var student in students) {
    String name = student["name"];

    List<int> scores = List<int>.from(student["scores"]);

    if (scores.isNotEmpty) {
      double sum = scores.reduce((a, b) => a + b).toDouble();
      double average = double.parse((sum / scores.length).toStringAsFixed(2));
      averages[name] = average;
    } else {
      averages[name] = 0.0;
    }
  }
  
  return averages;
}

Map<String, double> sortAverages(Map<String, double> averages) {
  List<MapEntry<String, double>> sortedEntries = averages.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  return Map.fromEntries(sortedEntries);
}
