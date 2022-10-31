import 'package:flutter/material.dart';
import '../Profile Screen/helper.dart';
import 'update_profile.dart';
import '../Profile Screen/constants.dart';
import '../Global/global_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.avatar,
    required this.id,
    required this.name,
    required this.friends,
    required this.likes,
    required this.images,
  }) : super(key: key);
  final String avatar;
  final List images;
  final String id;
  final String name;
  final int friends;
  final int likes;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String avatar;
  late List images;
  late String id;
  late String name;
  late int friends;
  late int likes;

  @override
  void initState() {
    super.initState();
    updateUI(widget.name, widget.id, widget.friends, widget.likes,
        widget.images, widget.avatar,);
  }

  void updateUI(String uName, String uId, int uFriends, int uLikes,
      List uImages, String uAvatar) {
    setState(() {
      name = uName;
      avatar = uAvatar;
      images = uImages;
      id = uId;
      friends = uFriends;
      likes = uLikes;
    });
  }

  List<Widget> scrollImages(List userImages) {
    List<Widget> allImages = [];
    for (String image in userImages) {
      allImages.add(
        SizedBox(
          height: 200.0,
          width: 200.0,
          child: Image.network(image),
        ),
      );
      allImages.add(
        kScrollImageSizedBox,
      );
    }
    return allImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: kProfileScreenPadding,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.id,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 105.0,
                child: MultipleGlobalWidgets.gCircularAvatar(avatar, 100.0),
              ),
            ),
            Text(
              name,
              style: kProfileNameStyle,
            ),
            kBelowProfileSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ProfileDetails(
                  title: 'Friends',
                  value: friends.toString(),
                ),
                ProfileDetails(
                  title: 'Likes',
                  value: likes.toString(),
                ),
                ProfileDetails(
                  title: 'ID',
                  value: id,
                ),
              ],
            ),
            kAboveUploadsSizedBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kUploadsText,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: scrollImages(images),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        await showDialog(
                        context: context,
                        builder: (context) {
                          return GlobalWidgets(userName: name, avatarImage: avatar, id: id);
                        },
                        ).then((value) => Navigator.pop(context, true));
                      },
                      label: kEditButtonText,
                      icon: kEditButtonIcon,
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        primary: Colors.amber,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Helper().deleteData(id).then((value) => {
                          Navigator.pop(context, true),
                          ScaffoldMessenger.of(context).showSnackBar(MultipleGlobalWidgets.gSnackBar('User deleted successfully'),),
                        });
                      },
                      label: kDeleteButtonText,
                      icon: kDeleteButtonIcon,
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        primary: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: kPDetailsTitleStyle,
        ),
        Text(
          value,
          style: kPDetailsValueStyle
        ),
      ],
    );
  }
}
