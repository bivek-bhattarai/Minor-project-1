import 'package:flutter/material.dart';
import '../Global/global_widgets.dart';
import 'package:intern_demo_3/Screens/Add%20User%20Screen/add_new_user.dart';
import 'package:intern_demo_3/Screens/Profile Screen/profile_page.dart';
import 'constants.dart';
import 'helper.dart';

class MainScreen extends StatefulWidget {
  static String id = 'MainScreen';

  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List userData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyData();
  }

  getMyData() async {
    await Helper().getData().then((value) => setState(() {
          userData = value;
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: kAppBarText,
      ),
      body: isLoading == false
          ? Scrollbar(
        thickness: 10.0,
            thumbVisibility: true,
            interactive: true,
            child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      var test = await Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProfilePage(
                                    avatar: userData[index]['avatar'],
                                    id: userData[index]['id'],
                                    name: userData[index]['name'],
                                    friends: userData[index]['friends'],
                                    likes: userData[index]['like'],
                                    images: [
                                      userData[index]['image1'],
                                      userData[index]['image2'],
                                      userData[index]['image3'],
                                      userData[index]['image4']
                                    ],
                                   ),
                              transitionDuration: kHeroDuration));

                      if (test) {
                        getMyData();
                      }

                    },
                    horizontalTitleGap: 70.0,
                    contentPadding: kListTileContentPadding,
                    title: Text(
                      userData[index]['name'],
                      style: kUserNameTextStyle,
                    ),
                    leading: Hero(
                      tag: userData[index]['id'],
                      child: MultipleGlobalWidgets.gCircularAvatar(userData[index]['avatar'], 30.0),
                    ),
                  );
                },
              ),
          )
          : kSpinKit,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var test = await showDialog(
            context: context,
            builder: (context) {
              return const AddNewUser();
            },
          );
          if (test == true) {
            getMyData();
          }
        },
        backgroundColor: Colors.amber,
        elevation: 10.0,
        child: kFloatingActionIcon,
      ),
    );
  }
}
