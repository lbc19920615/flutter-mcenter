import 'dart:convert';

import 'package:flutter/material.dart';

class IconItem {
  final IconData icon;
  final String name;
  IconItem({
    required this.icon,
    required this.name,
  });

  IconItem copyWith({
    IconData? icon,
    String? name,
  }) {
    return IconItem(
      icon: icon ?? this.icon,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon.codePoint,
      'name': name,
    };
  }

  factory IconItem.fromMap(Map<String, dynamic> map) {
    return IconItem(
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IconItem.fromJson(String source) =>
      IconItem.fromMap(json.decode(source));

  @override
  String toString() => 'IconItem(icon: $icon, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconItem && other.icon == icon && other.name == name;
  }

  @override
  int get hashCode => icon.hashCode ^ name.hashCode;
}
