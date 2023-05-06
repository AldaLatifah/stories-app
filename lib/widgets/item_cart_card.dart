// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of 'widgets.dart';

class ItemCartCard extends StatelessWidget {
  const ItemCartCard(
      {Key? key,
      required this.name,
      required this.buku,
      required this.jumlah,
      required this.onUpdate,
      required this.onDelete,
      required this.onQuantity})
      : super(key: key);

  final String name;
  final String buku;
  final String jumlah;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;
  final VoidCallback onQuantity;

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
                              jumlah,
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
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onUpdate,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 1,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: onQuantity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 1,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: onDelete,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 1,
                              ),
                              child: Icon(
                                Icons.restore_from_trash,
                                size: 15,
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
