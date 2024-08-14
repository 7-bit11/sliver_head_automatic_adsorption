// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

/// 动画基类
abstract class AnimatedBit extends StatefulWidget {
  final Widget child;

  /// 动画时长
  final Duration? duration;

  /// 延迟时间
  final Duration? delay;

  /// 控制器创建成功回调
  Function(AnimationController controller)? onCreate;

  /// 动画曲线
  final Curve? curve;

  /// 构造方法
  AnimatedBit(
      {super.key,
      required this.child,
      this.duration,
      this.delay,
      this.onCreate,
      this.curve})
      : super();
}
