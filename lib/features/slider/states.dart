

part of 'bloc.dart';
class SliderStates{}

class GetSliderLoadingState extends SliderStates{}
class GetSliderFailedState extends SliderStates{
  final String msg;

  GetSliderFailedState({required this.msg});
}
class GetSliderSuccessState extends SliderStates{
  final List<SliderModel> list;
  final int currentIndex;



  GetSliderSuccessState({required this.list,required this.currentIndex});

}
