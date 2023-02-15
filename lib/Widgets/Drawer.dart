import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://i.ytimg.com/vi/gdx7gN1UyX0/maxresdefault.jpg";
    return Drawer(
      child: Container(
        // color: Colors.deepPurple,
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Hammad Khan"),
                accountEmail: Text("Hammad@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  foregroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                CupertinoIcons.home,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.profile_circled,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                CupertinoIcons.mail,
              ),
              title: const Text(
                "Email",
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
