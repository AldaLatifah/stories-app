// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference buku = firestore.collection("buku");
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff8E9BDE), Color(0xff5365D0)])),
      child: ListView(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/peterpan.jpg'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              left: 24,
            ),
            child: const Text(
              "Bumi : Series",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder<QuerySnapshot>(
                stream: buku.snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Row(
                          children: snapshot.data!.docs
                              .map((e) => MyContainer(gambar: e.get("gambar")))
                              .toList())
                      : Container();
                }),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              left: 24,
            ),
            child: const Text(
              "Today's Favorite",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StreamBuilder<QuerySnapshot>(
                stream: buku.snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: snapshot.data!.docs
                              .map(
                                (e) => MyCard(
                                    id: e.id,
                                    gambar: e.get("gambar"),
                                    judul: e.get("judul"),
                                    desc: e.get("detail"),
                                    penulis: e.get("penulis")),
                              )
                              .toList())
                      : Container();
                }),
          ),
        ],
      ),
    );
  }
}
