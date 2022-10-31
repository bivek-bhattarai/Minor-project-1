import 'package:flutter/material.dart';
import 'package:intern_demo_3/Screens/Profile%20Screen/update_profile.dart';
import 'constants.dart';
import 'helper.dart';
import '../Global/global_widgets.dart';
import '../Add User Screen/widgets.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  late String newUserName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10.0,
      actions: <Widget>[
        AddScreenWidgets().alertBoxTextButton(
            kSubmitButtonText,
            () async => {
                  if (_formKey.currentState!.validate()) {
                    await Helper().addUser(newUserName).then((value) => {
                      Navigator.pop(context, true),
                      ScaffoldMessenger.of(context).showSnackBar(
                        MultipleGlobalWidgets.gSnackBar('User added successfully'),
                      ),
                    }),
                    kTextFieldLabelStyle = const TextStyle(color: Colors.amber),
                  } else {
                    setState(() {
                      kTextFieldLabelStyle = const TextStyle(color: Colors.red);
                    }),
                  }
                }),
        AddScreenWidgets().alertBoxTextButton(
            kCancelButtonText,
            () => {
                  Navigator.pop(context),
              kTextFieldLabelStyle = const TextStyle(color: Colors.amber),
                }),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: kTextFormFieldPadding,
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  } else {
                    return null;
                  }
                },
                style: kTextFieldStyle,
                cursorColor: Colors.amber,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: kTextFieldBorderDecoration,
                  focusedBorder: OutlineInputBorder(
                    borderSide: kTextFieldBorder,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: kTextFieldLabel,
                  labelStyle: kTextFieldLabelStyle,
                ),
                onChanged: (value) {
                  newUserName = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
