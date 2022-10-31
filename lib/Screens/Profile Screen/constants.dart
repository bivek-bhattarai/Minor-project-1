import 'package:flutter/material.dart';

// Constants for ProfilePage class

const kScrollImageSizedBox = SizedBox(
  width: 10.0,
);

const kProfileScreenPadding =
    EdgeInsets.symmetric(vertical: 25.0, horizontal: 15);

const kProfileNameStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

const kBelowProfileSizedBox = SizedBox(
  height: 10.0,
);

const kAboveUploadsSizedBox = SizedBox(
  height: 30.0,
);

const kUploadsText = Text(
  'Uploads',
  style: TextStyle(
    fontSize: 23.0,
    color: Colors.grey,
  ),
);

const kEditButtonText = Text('Edit Profile');

const kEditButtonIcon = Icon(Icons.edit);

const kDeleteButtonText = Text('Delete Profile');

const kDeleteButtonIcon = Icon(Icons.delete);

const kPDetailsTitleStyle = TextStyle(
  fontSize: 23.0,
  color: Colors.grey,
);

const kPDetailsValueStyle = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.bold,
);

// Constants for UpdateProfile class

const kUpdatePageSubmitButtonText = Text(
  'Submit',
  style: TextStyle(color: Colors.amber),
);

const kUpdatePageCancelButtonText = Text(
  'Cancel',
  style: TextStyle(color: Colors.amber),
);

const kUpdatePageTextFieldPadding = EdgeInsets.only(top: 15.0);

const kUpdatePageTextFieldBorder = OutlineInputBorder();

const kUpdatePageTFBorderSide = BorderSide(color: Colors.amber, width: 2.0);

const kUpdatePageTFLabel = Text('Name');

var kUpdatePageTFLabelStyle = const TextStyle(color: Colors.amber);
