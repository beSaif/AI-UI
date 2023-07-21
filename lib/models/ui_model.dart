class UIModel {
  final int id;
  Map<String, dynamic> data;

  UIModel({required this.id, required this.data});

  factory UIModel.fromJson(Map<String, dynamic> json) {
    return UIModel(
      id: json['id'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'data': data,
      };
}
