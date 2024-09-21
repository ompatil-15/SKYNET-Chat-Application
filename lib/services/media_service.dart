import 'dart:io';
import 'dart:html' as html;
import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();

  MediaService() {}

  Future<File?> getImageFromGallery() async {
    final XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return File(_file.path);
    }
    return null;
  }

  Future<html.File?> getImageFromGalleryWeb() async {
    final XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return html.File(
          [], _file.name); // Web uses html.File instead of dart:io.File
    }
    return null;
  }
}
