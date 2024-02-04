abstract class ImageLabelingStates {}

class ImageLabelingInitialState extends ImageLabelingStates{}


class PickImageLoadingState extends ImageLabelingStates{}
class PickImageSuccessState extends ImageLabelingStates{}
class PickImageErrorState extends ImageLabelingStates{}

class GetImageLabelsLoadingState extends ImageLabelingStates{}
class GetImageLabelsSuccessState extends ImageLabelingStates{}
