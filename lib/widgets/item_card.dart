// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of 'widgets.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.name,
      required this.buku,
      required this.alamat,
      required this.noHp,
      required this.type})
      : super(key: key);

  final String name;
  final String buku;
  final String alamat;
  final String noHp;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Color(0xffA8B2E4).withOpacity(0.8),
          ),
          Container(
            width: 8,
            height: 100,
            color: const Color(0xffA8B2E4),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22,
              right: 14,
              top: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PEMBELIAN BERHASIL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 1,
                        ),
                        child: type == 'pengantaran'
                            ? Text(
                                'Sedang Diantar',
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontSize: 9,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            : Text(
                                'Pesanan Diterima',
                                style: GoogleFonts.poppins(
                                  color: Colors.green,
                                  fontSize: 9,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  buku,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  alamat,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 1,
                            ),
                            child: Text(
                              name,
                              style: GoogleFonts.poppins(
                                color: const Color(0xffA8B2E4),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 1,
                            ),
                            child: Text(
                              noHp,
                              style: GoogleFonts.poppins(
                                color: const Color(0xffA8B2E4),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
