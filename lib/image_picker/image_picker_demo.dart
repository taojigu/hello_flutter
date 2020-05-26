import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File _bufferImageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo ImagePicker'),
      ),
      body: ListView(
        children: [
          _pickImageFromAlbumButton(),
          _pickImageFromCameraButton(),
          _imageWidget(),
        ]
      )
    );
  }

  Widget _pickImageFromAlbumButton() {
    return RaisedButton(
      child: Text('pick from Album'),
      onPressed:  () async {
        _bufferImageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
          
        });
      },
    );
  }

  Widget _pickImageFromCameraButton() {
    return RaisedButton(
      child: Text('pick from Camera'),
      onPressed:  () async {
        _bufferImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          
        });
      },
    );
  }

  Widget _imageWidget() {
    if (null == _bufferImageFile) {
      return Text('Image not selected');
    }
    return Image.file(_bufferImageFile);
  }
}
