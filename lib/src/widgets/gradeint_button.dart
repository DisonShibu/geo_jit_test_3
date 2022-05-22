import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final bool isColorGreen;
  final bool borderRadiusSharp;
  final bool isLoading;
  final bool clearButton;
  GradientButton(
      {this.title,
        this.onPressed,
      this.clearButton = false,
      this.isColorGreen,
      this.borderRadiusSharp = true,
      this.isLoading = false});

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: widget.clearButton==true?screenWidth(context,dividedBy: 3):screenWidth(context, dividedBy: 1.7),
        height: widget.clearButton==true?screenHeight(context,dividedBy: 18):screenHeight(context, dividedBy: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            widget.clearButton == true
                ? Colors.white
                : Constants.kitGradients[5],
            widget.clearButton==true?Colors.white:Constants.kitGradients[4],
            widget.clearButton==true?Colors.white:Constants.kitGradients[4],
          ]),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Constants.kitGradients[4])
        ),
        child: Center(
          child: Text(
                  widget.title.toString(),
                  style: TextStyle(
                      color:widget.clearButton==true?Colors.black: Constants.kitGradients[0],
                      fontFamily: 'PromptLight',
                      fontSize: widget.clearButton == true ? 14 : 18),
                ),
        )

      ),
    );
  }
}
