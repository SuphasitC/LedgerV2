import 'package:flutter/material.dart';

List<Pocket> pockets = [];

class Pocket {
  String name;
  double currentBalance;
  Color color;
  String id;

  Pocket(this.name, this.currentBalance, this.color, this.id);
}
