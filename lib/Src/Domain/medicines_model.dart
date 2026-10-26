import 'package:flutter/material.dart';

class MedicinesModel {
  final String name;
  final String dosage;
  final String instructions;
  final String time;

  final ValueNotifier<bool> istaken;

  MedicinesModel({
    required this.name,
    required this.dosage,
    required this.instructions,
    required this.time,
    bool istaken = false,
  }) : istaken = ValueNotifier<bool>(istaken);

  factory MedicinesModel.fromJson(Map<String, dynamic> json) {
    return MedicinesModel(
      name: json['name'].toString(),
      dosage: json['dosage'].toString(),
      instructions: json['instructions'].toString(),
      time: json['time'].toString(),
      istaken: json['istaken'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'instructions': instructions,
      'time': time,
      'istaken': istaken.value,
    };
  }

  void dispose() {
    istaken.dispose();
  }
}
