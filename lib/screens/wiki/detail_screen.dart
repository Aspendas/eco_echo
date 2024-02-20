import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WikiDetailScreen extends StatelessWidget {
  const WikiDetailScreen({Key? key, required this.title}) : super(key: key);
  final String title;

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          FutureBuilder<DocumentSnapshot>(
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

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(content),
              );
            },
          ),
        ],
      ),
    );
  }
}
