import '../config.dart';

class SliderModel {
  final String sliderName;
  final String sliderImage;
  final String sliderId;

  SliderModel({
    required this.sliderName,
    required this.sliderImage,
    required this.sliderId,
  });
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      sliderName: (json['sliderName'] ?? "").toString(),
      sliderImage: (json['sliderImage'] ?? "").toString(),
      sliderId: (json['sliderId'] ?? "").toString(),
    );
  }
}

extension SliderModelExt on SliderModel {
  String get fullImagePath => Config.imageURL + sliderImage;
}


/*

import 'package:freezed_annotation/freezed_annotation.dart';

import '../config.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

List<SliderModel> slidersFromJson(dynamic str) => List<SliderModel>.from(
      (str).map(
        (x) => SliderModel.fromJson(x),
      ),
    );

@freezed
abstract class SliderModel with _$SliderModel {
  factory SliderModel({
    required String sliderName,
    required String sliderImage,
    required String sliderId,
  }) = _Slider;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

extension SliderModelExt on SliderModel {
  String get fullImagePath => Config.imageURL + sliderImage;
}
*/