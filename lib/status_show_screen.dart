import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/providers/getStatusProvider.dart';

class Show_Screen extends StatefulWidget {
  const Show_Screen({Key? key}) : super(key: key);

  @override
  State<Show_Screen> createState() => _Show_ScreenState();
}

class _Show_ScreenState extends State<Show_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final statusprovider =
        Provider.of<GetStatusProvider>(context, listen: false)
            .setStatusImages();
  }

  @override
  Widget build(BuildContext context) {
    final statusprovider =
        Provider.of<GetStatusProvider>(context, listen: false);

    return Scaffold(
      // Statues fetched by Consumer

      // body: Consumer<getStatusProvider>(builder: (context, snapshot, child) {
      //   return ListView.builder(
      //     itemCount: snapshot.getStatusImages.length,
      //     shrinkWrap: true,
      //     primary: false,
      //     itemBuilder: (context, index) {
      //       final data = snapshot.getStatusImages[index];
      //       return Container(
      //         height: 200,
      //         width: 200,
      //         child: Image.file(File(data.path)),
      //       );
      //     },
      //   );
      // }),

      // Status fetched by Selector

      body: Selector<GetStatusProvider, List<FileSystemEntity>>(
          selector: (_, value) => value.getStatusImages,
          builder: (context, snapshot, child) {
            return GridView.builder(
              itemCount: snapshot.length,
              padding: EdgeInsets.all(10),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                final data = snapshot[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black),
                  height: 200,
                  width: 200,
                  child: Image.file(
                    File(data.path),
                    fit: BoxFit.fitHeight,
                  ),
                );
              },
            );

            // return ListView.builder(
            //   itemCount: snapshot.length,
            //   shrinkWrap: true,
            //   primary: false,
            //   itemBuilder: (context, index) {
            //     final data = snapshot[index];
            //     return Container(
            //       height: 200,
            //       width: 200,
            //       child: Image.file(File(data.path)),
            //     );
            //   },
            // );
          }),
    );
  }
}
