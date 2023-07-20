class ProgressModel {
  String id;
  String progress;
  String data;

  ProgressModel({
    required this.id,
    required this.progress,
    required this.data,
  });

  ProgressModel.fromMap(Map<String, dynamic> map):
    id = map["id"],
    progress = map["progress"],
    data = map["data"];

    Map<String, dynamic> toMap() {
      return {
        "id": id,
        "progress": progress,
        "data": data,
      };
    }
}