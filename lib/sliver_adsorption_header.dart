// ignore_for_file: file_names, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DebouncedSearch {
  late Duration duration;
  Timer? _timer;

  DebouncedSearch({required this.duration});

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }
}

/// 自定义顶部滑动
class SliverHeaderAutomaticDelegate extends SliverPersistentHeaderDelegate {
  /// 折叠高度
  final double collapsedHeight;

  /// 展开高度
  final double expandedHeight;

  /// 顶部距离
  final double paddingTop;

  /// 滚动控制器
  ScrollController? controller;

  /// 折叠后显示组件
  final Widget? collapsedWidget;

  /// 展开后显示组件
  final Widget expandedWidget;

  /// 展开时的背景颜色
  final Color? expandedColors;

  /// 折叠时的背景颜色
  final Color? collapsedColors;

  /// 默认的折叠组件Title
  final String? defaultCollapsedTitle;

  /// 默认的折叠组件Title
  final Color? defaultCollapsedColor;

  /// 动画执行时间
  /// 默认 300ms
  late Duration durationAnimation;

  /// 更新背景颜色
  late Function(Color)? updateBackgroundColor;

  /// 动画曲线
  final Curve? curve;
  SliverHeaderAutomaticDelegate(
      {this.controller,
      this.collapsedWidget,
      this.collapsedColors,
      this.expandedColors,
      this.defaultCollapsedTitle,
      this.defaultCollapsedColor,
      this.updateBackgroundColor,
      this.curve = Curves.ease,
      this.durationAnimation = const Duration(milliseconds: 300),
      required this.collapsedHeight,
      required this.expandedHeight,
      required this.paddingTop,
      required this.expandedWidget});

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  ///防抖
  /// 防抖动，防止多次触发
  /// 100ms内只触发一次
  final debouncer =
      DebouncedSearch(duration: const Duration(milliseconds: 100));

  ///默认折叠组件
  Widget _defaultCollapsedWidget(dynamic shrinkOffset) {
    return AppBar(
      backgroundColor: _makeStickyHeaderBgColor(shrinkOffset),
      surfaceTintColor: _makeStickyHeaderBgColor(shrinkOffset),
      title: Text(
        defaultCollapsedTitle ?? "Appbar",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: _makeStickyHeaderTextColor(shrinkOffset, true),
        ),
      ),
    );
  }

  /// 更新状态栏
  void _updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset <= maxExtent / 2) {
      debouncer.run(() {
        controller?.animateTo(0,
            duration: durationAnimation, curve: Curves.ease);
      });
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else if (shrinkOffset > maxExtent / 2 &&
        shrinkOffset <= maxExtent - (paddingTop * 2.5)) {
      debouncer.run(() {
        if ((shrinkOffset + paddingTop * 3) >= maxExtent) {
          return;
        }
        controller?.animateTo(maxExtent - (paddingTop * 2.5),
            duration: durationAnimation, curve: Curves.ease);
      });
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    }
  }

  /// 计算透明度
  double _makeStickyHeaderTitleAlpha(shrinkOffset) {
    final double alpha =
        (shrinkOffset / (maxExtent - minExtent) * 1).clamp(0, 1).toDouble();
    return alpha;
  }

  /// 背景颜色
  Color _makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();

    /// 使用传递的RGB
    if (collapsedColors case Color color?) {
      return Color.fromARGB(alpha, color.red, color.green, color.blue);
    }

    /// 默认RGB 绿色
    return Color.fromARGB(alpha, 177, 216, 92);
  }

  /// 文字颜色
  Color _makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();

    /// 使用传递的RGB
    if (defaultCollapsedColor case Color color?) {
      return Color.fromARGB(alpha, color.red, color.green, color.blue);
    }
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    _updateStatusBarBrightness(shrinkOffset);
    if (updateBackgroundColor != null) {
      updateBackgroundColor!(_makeStickyHeaderBgColor(shrinkOffset));
    }
    return Container(
      color: _makeStickyHeaderBgColor(shrinkOffset),
      height: maxExtent,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
            height: collapsedHeight,
            child: Stack(children: [
              Opacity(
                  opacity: 1 - _makeStickyHeaderTitleAlpha(shrinkOffset),
                  child: expandedWidget),
              Opacity(
                  opacity: _makeStickyHeaderTitleAlpha(shrinkOffset),
                  child:
                      collapsedWidget ?? _defaultCollapsedWidget(shrinkOffset)),
            ])),
      ),
    );
  }
}
