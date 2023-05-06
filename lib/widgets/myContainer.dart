part of 'widgets.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key, required this.gambar}) : super(key: key);

  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      margin: const EdgeInsets.only(top: 10, left: 22),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(gambar),
        ),
      ),
    );
  }
}
