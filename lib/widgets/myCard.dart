part of 'widgets.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {Key? key,
      required this.gambar,
      required this.judul,
      required this.desc,
      required this.penulis,
      required this.id})
      : super(key: key);

  final String gambar, judul, desc, penulis, id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffA8B2E4),
      ),
      width: 361,
      height: 163,
      child: Row(children: [
        Image.network(
          gambar,
          width: 99,
          height: 148,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                penulis,
                style: GoogleFonts.poppins(fontSize: 10),
              ),
              Text(
                judul,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 70,
              ),
              Text(desc,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(fontSize: 10)),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    DetailPage(
                      id: id,
                      title: judul,
                      desc: desc,
                      gambar: gambar,
                      penulis: penulis,
                    ),
                  );
                },
                child: Container(
                  width: 98,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Selengkapnya",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
