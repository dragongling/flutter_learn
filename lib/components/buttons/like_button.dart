import 'package:flutter/material.dart';

class LikeButtonParams {
  ButtonStyle? style;
  IconData? icon;
  String text;

  LikeButtonParams({this.style, this.icon, required this.text});
}

class LikeButton extends StatelessWidget {
  final VoidCallback? onLikePressed;
  final bool? isPressed;

  const LikeButton({
    super.key,
    this.onLikePressed,
    this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final likedStyle = LikeButtonParams(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      icon: Icons.favorite,
      text: 'Liked',
    );
    final defaultStyle = LikeButtonParams(
      icon: Icons.favorite_border,
      text: 'Like',
    );
    var currentStyle = (isPressed ?? false) ? likedStyle : defaultStyle;

    return ElevatedButton(
      onPressed: onLikePressed,
      style: currentStyle.style,
      child: Row(
        children: [
          Icon(currentStyle.icon),
          SizedBox(width: 5),
          Text(currentStyle.text),
        ],
      ),
    );
  }
}