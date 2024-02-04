import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_labeling/controler/cubit/cubit.dart';
import 'package:image_labeling/controler/cubit/state.dart';
import 'package:image_labeling/views/widgets/custom_image.dart';
import 'package:image_labeling/views/widgets/custom_text_result.dart';

class ImageLabelingViewBody extends StatelessWidget {
  const ImageLabelingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageLabelingCubit , ImageLabelingStates>(
      builder: (context , state){
        var cubit = ImageLabelingCubit.get(context);
        return  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomImage(imageFile: cubit.imageFile),
                  const SizedBox(height: 10,),
                  CustomTextResult(result:cubit.imageLabels),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
