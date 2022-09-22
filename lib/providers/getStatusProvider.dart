import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:status_saver/constants/constant.dart';

class GetStatusProvider with ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  int num = 0;
  void setStatusImages() async {
    final status = await Permission.storage.request();

    if (status.isDenied) {
      Permission.storage.request();
      print("Status Denied");
    }
    if (status.isGranted) {
      final directory = Directory(Constant.whatsapp_status_path);
      if (directory.existsSync()) {
        // final itemlist = directory
        //     .listSync()
        //     .where((element) => element.path.endsWith('.jpg'))
        //     .toList();
        // log(itemlist.toString());
        final itemlist = directory.listSync();
        _getImages =
            itemlist.where((element) => element.path.endsWith('.jpg')).toList();
        notifyListeners();
      } else {
        log('whatsapp not found');
        notifyListeners();
      }
    }
  }

  List<FileSystemEntity> get getStatusImages => _getImages;
}
