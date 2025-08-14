import 'package:flutter/material.dart';
import 'package:mobile_07_08/Components/ActionButton/action_button_view_model.dart';
import 'package:mobile_07_08/Shared/Colors.dart';
import 'package:mobile_07_08/Shared/Styles.dart';

class ActionButton extends StatelessWidget {
  
  final ActionButtonViewModel viewModel;
  
  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {

    double verticalPadding = 12.0;
    double horizontalPadding = 32.0;
    Color backgroundColor = primaryBaseColor;
    double size = 16.0;
    
    
    switch(viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = primaryBaseColor;
        break;

      case ActionButtonStyle.secondary:
        backgroundColor = secondaryBaseColor;
        break;

      case ActionButtonStyle.tertiary:
        backgroundColor = tertiaryBaseColor;
        break;
    }

    switch(viewModel.size) {
      case ActionButtonSize.small:
        size = 16.0;
        break;

      case ActionButtonSize.medium:
        size = 24.0;
        break;

      case ActionButtonSize.large:
        size = 32.0;
        break;
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: regular,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      ),
      child: Text(viewModel.text),
    );
  }
}