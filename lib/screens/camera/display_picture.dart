// A widget that displays the picture taken by the user.
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  String text = "a";
  bool loading = false;
  final gemini = Gemini.instance;

  void textAndImageGemini() {
    loading = true;
    gemini.textAndImage(
        text:
            """This is for recycling app and you are going to describe how to recycle this item. It should be at least 300 words.
                   You can also include alternative ways to use the item in the photo.""",

        /// text
        images: [File(widget.imagePath).readAsBytesSync()]

        /// list of images
        ).then((value) {
      log(value?.content?.parts?.last.text ?? '');
      setState(() {
        text = value?.content?.parts?.last.text ?? '';
        loading = false;
      });
    }).catchError((e) {
      log('textAndImageInput', error: e);
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    textAndImageGemini();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: ListView(
        children: [
          Image.file(
            File(widget.imagePath),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
          ),
          const SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
