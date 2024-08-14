// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:sliver_head_automatic_adsorption/animation/animated.dart';

/// 上滑动画
class SlideDownAnimationBit extends AnimatedBit {
  /// 开始
  final Offset? begin;

  /// 结束
  final Offset? end;
  SlideDownAnimationBit({
    super.key,
    this.begin,
    this.end,
    required super.child,
    super.duration,
    super.delay,
    super.onCreate,
    super.curve,
  });

  @override
  _AnimationSlideState createState() => _AnimationSlideState();
}

class _AnimationSlideState extends State<SlideDownAnimationBit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: widget.begin ?? const Offset(0, -2), // 控制动画起始位置 (屏幕下方)
      end: widget.end ?? const Offset(0, 0), // 控制动画结束位置 (屏幕中间)
    ).animate(CurvedAnimation(
        parent: _controller, curve: widget.curve ?? Curves.easeInOut));

    /// 控制器创建成功回调
    widget.onCreate?.call(_controller);
    _startAnimation();
  }

  void _startAnimation() {
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted) _controller.forward();
      });
      return;
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
