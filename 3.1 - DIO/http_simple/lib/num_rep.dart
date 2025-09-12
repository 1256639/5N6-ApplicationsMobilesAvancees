import 'package:json_annotation/json_annotation.dart';

part 'num_rep.g.dart';

@JsonSerializable()
class NumberResponse {
  final int result;

  NumberResponse({required this.result});

  factory NumberResponse.fromJson(Map<String, dynamic> json) => _$NumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NumberResponseToJson(this);
}