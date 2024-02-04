import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controler/color.dart';
import '../../controler/cubit/cubit.dart';
import '../../controler/cubit/state.dart';

class CustomPickImageButton extends StatelessWidget {
  const CustomPickImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageLabelingCubit , ImageLabelingStates>(
      builder: (context , state){
        var cubit = ImageLabelingCubit.get(context);
        return FloatingActionButton.extended(
          backgroundColor: mainColor,
          onPressed: () {
            cubit.pickImage();
          },
          label: const Text(
            'Pick Image',
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    );
  }
}