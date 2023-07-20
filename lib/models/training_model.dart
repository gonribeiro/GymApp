class TrainingModel {
  String id;
  String name;
  String training;
  String howTo;
  String? urlImage;

  TrainingModel({
    required this.id,
    required this.name,
    required this.training,
    required this.howTo,
  });

  TrainingModel.fromMap(Map<String, dynamic> map):
    id = map["id"],
    name = map["name"],
    training = map["training"],
    howTo = map["howTo"];

    Map<String, dynamic> toMap() {
      return {
        "id": id,
        "name": name,
        "training": training,
        "howTo": howTo
      };
    }
}