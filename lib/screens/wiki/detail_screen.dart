import 'package:eco_echo/widgets/wiki/map_sample.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/wiki/youtube_video_player.dart';

class WikiDetailScreen extends StatelessWidget {
  const WikiDetailScreen({Key? key, required this.title, required this.index})
      : super(key: key);
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('categories')
        .doc(title) // Assuming `title` is the document ID
        .get()
        .then((value) => print(value.data()));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green[200],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('categories')
            .doc(title) // Assuming `title` is the document ID
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(
              child: Text('No data found'),
            );
          }

          // Access data from snapshot
          var data = snapshot.data!.data() as Map<String, dynamic>;
          // Assuming your document has a field named 'content'
          String content = data['text'] ?? 'No content available';

          var width = MediaQuery.of(context).size.width;

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                        width: width,
                        height: (width * 9 / 16),
                        child: MyHomePage(
                          videoIndex: index,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(content),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Recycling Centers Near You:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 300,
                  child: MapSample(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
