import 'package:flutter/material.dart';
import '../Profile Screen/helper.dart';
import '../Global/global_widgets.dart';
import '../Profile Screen/constants.dart';

class GlobalWidgets extends StatefulWidget {
  const GlobalWidgets(
      {Key? key,
      required this.userName,
      required this.avatarImage,
      required this.id})
      : super(key: key);

  final String userName;
  final String avatarImage;
  final String id;

  @override
  State<GlobalWidgets> createState() => _GlobalWidgetsState();
}

class _GlobalWidgetsState extends State<GlobalWidgets> {

  final _updateFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String updatedName = widget.userName;
    return AlertDialog(
      elevation: 5.0,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (_updateFormKey.currentState!.validate()) {
              Helper()
                  .updateData(widget.id, updatedName)
                  .then((value) => Navigator.pop(context, true)).then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(MultipleGlobalWidgets.gSnackBar('Updated successfully'),),
              });
              kUpdatePageTFLabelStyle = const TextStyle(color: Colors.amber);
            } else {
              setState(() {
                kUpdatePageTFLabelStyle = const TextStyle(color: Colors.red);
              });
            }
          },
          child: kUpdatePageSubmitButtonText,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            kUpdatePageTFLabelStyle = const TextStyle(color: Colors.amber);
          },
          child: kUpdatePageCancelButtonText,
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MultipleGlobalWidgets.gCircularAvatar(widget.avatarImage, 80.0),
          Padding(
            padding: kUpdatePageTextFieldPadding,
            child: Form(
              key: _updateFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user\'s name';
                  } else {
                    return null;
                  }
                },
                initialValue: widget.userName,
                autofocus: false,
                cursorColor: Colors.amber,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: kUpdatePageTextFieldBorder,
                  focusedBorder: OutlineInputBorder(
                    borderSide: kUpdatePageTFBorderSide,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: kUpdatePageTFLabel,
                  labelStyle: kUpdatePageTFLabelStyle,
                ),
                onChanged: (value) {
                  updatedName = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
