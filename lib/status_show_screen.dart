import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/providers/getStatusProvider.dart';

class Show_Screen extends StatefulWidget {
  @override
  State<Show_Screen> createState() => _Show_ScreenState();
}

class _Show_ScreenState extends State<Show_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final statusprovider =
        Provider.of<getStatusProvider>(context, listen: false)
            .setStatusImages();
  }

  @override
  Widget build(BuildContext context) {
    final statusprovider =
        Provider.of<getStatusProvider>(context, listen: false);

    return Scaffold(
      body: Consumer<getStatusProvider>(builder: (context, snapshot, child) {
        return ListView.builder(
          itemCount: snapshot.getStatusImages.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final data = snapshot.getStatusImages[index];
            return Container(
              height: 200,
              width: 200,
              child: Image.file(File(data.path)),
            );
          },
        );
      }),
    );
  }
}
