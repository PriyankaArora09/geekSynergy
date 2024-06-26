import 'package:ggeksynergy/pages/homeScreen/homescreen_controller.dart';
import 'package:ggeksynergy/pages/homeScreen/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.movies.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];
                return ContainerWidget.containerWidget(
                  votes: movie['voting'].toString(),
                  url: movie['poster'],
                  name: movie['title'],
                  genre: movie['genre'],
                  director: movie['director'].join(', '),
                  starring: movie['stars'].join(', '),
                  views: movie['pageViews'].toString(),
                  releaseDate: DateTime.fromMillisecondsSinceEpoch(
                          movie['releasedDate'] * 1000)
                      .toString(),
                  votingPeople: movie['totalVoted'].toString(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
