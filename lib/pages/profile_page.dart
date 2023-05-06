import 'package:flutter/material.dart';
import 'package:pa_stories/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/profile-image.png",
            width: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Storivers",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'Syarat Dan Ketentuan',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'Kebijakan Privasi',
          ),
        ],
      )),
    );
  }
}
