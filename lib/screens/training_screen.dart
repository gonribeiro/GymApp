import 'package:flutter/material.dart';
import 'package:gymapp/_common/app_color.dart';
import 'package:gymapp/models/training_model.dart';
import 'package:gymapp/models/progress_model.dart';

class TrainingScreen extends StatelessWidget {
  TrainingScreen({super.key});

  final TrainingModel training = TrainingModel(
    id: "id", name: "name", training: "training", howTo: "como fazer"
  );

  final List<ProgressModel> progressList = [
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
    ProgressModel(id: "id1", progress: "progresso", data: "data1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(children: [
          Text(
            training.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            training.training,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ]),
        centerTitle: true,
        backgroundColor: AppColors.darkBlue,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32)
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("click!");
        },
        child: const Icon(Icons.add)
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar Foto")
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("remover foto")
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            Text(
              training.howTo
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(progressList.length, (index) {
                ProgressModel currentProgress = progressList[index];

                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(currentProgress.progress),
                  subtitle: Text(currentProgress.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      print("DELETAR ${currentProgress.progress}");
                    }
                  ),
                );
              }),
            )
          ],
        ),
      )
    );
  }
}