import 'package:flutter/material.dart';
import 'package:mobile_07_08/Components/ActionButton/action_button_view_model.dart';
import 'package:mobile_07_08/Shared/Colors.dart';
import 'package:mobile_07_08/Shared/Styles.dart';

abstract class ActionButtonDelegate {
  void onClick(ActionButtonViewModel viewModel);
}
class ActionButton extends StatelessWidget {
  
  final ActionButtonViewModel viewModel;
  Color backgroundColor;
  int size = 16;
  ActionButtonDelegate? delegate;
  
  ActionButton._(
    {
      super.key, 
      required this.viewModel, 
      this.backgroundColor = primaryBaseColor,
      this.size = 16,
    });

   static ActionButton instantiate({
    required ActionButtonViewModel viewModel, 
    backgroundColor = primaryBaseColor
    }) {
    return ActionButton._(viewModel: viewModel);
  }

  void setStyle(ActionButtonStyle style) {
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
  }

  void setSize(ActionButtonSize size) {
    switch(viewModel.size) {
      case ActionButtonSize.small:
        this.size = 16;
        break;

      case ActionButtonSize.medium:
        this.size = 24;
        break;

      case ActionButtonSize.large:
        this.size = 32;
        break;
    }
  }

  Widget createElevatedButton() {
    double verticalPadding = 12.0;
    double horizontalPadding = 32.0;

    return ElevatedButton(
      onPressed: () { delegate?.onClick(viewModel); },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: regular,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      ),
      child: Text(viewModel.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStyle(viewModel.style);
    setSize(viewModel.size);
    return createElevatedButton();
    
  }
}