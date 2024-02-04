import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_labeling/controler/cubit/state.dart';
import 'package:image_picker/image_picker.dart';

class ImageLabelingCubit extends Cubit<ImageLabelingStates> {
  ImageLabelingCubit() : super(ImageLabelingInitialState());

  static ImageLabelingCubit get(context) => BlocProvider.of(context);

  String imageLabels = '';
  File? imageFile;

  void pickImage() async {
    emit(PickImageLoadingState());
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        getImageLabels(pickedImage);
        imageFile = File(pickedImage.path);
        emit(PickImageSuccessState());
      }
    } catch (e) {
      emit(PickImageErrorState());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getImageLabels(XFile image) async {
    emit(GetImageLabelsLoadingState());
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions());
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    StringBuffer result = StringBuffer();
    for (ImageLabel imageLabel in labels) {
      String labelText = imageLabel.label;
      double confidence = imageLabel.confidence;
      result.write(labelText);
      result.write(' : ');
      result.write((confidence * 100).toStringAsFixed(2));
      result.write('%\n');
    }
    imageLabeler.close();
    imageLabels = result.toString();
    emit(GetImageLabelsSuccessState());
  }
}
