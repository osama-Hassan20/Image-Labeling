import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_labeling/views/image_labeling_view.dart';
import 'controler/blocobserver.dart';
import 'controler/cubit/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ImageLabelingApp());
}

class ImageLabelingApp extends StatelessWidget {
  const ImageLabelingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ImageLabelingCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageLabelingView(),
      ),
    );
  }
}
