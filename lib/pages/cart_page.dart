// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

part of 'pages.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference cart = firestore.collection("cart");

    CollectionReference pesanan = firestore.collection("pesanan");

    TextEditingController nama = TextEditingController();
    TextEditingController alamat = TextEditingController();
    TextEditingController no_hp = TextEditingController();
    TextEditingController jumlah = TextEditingController();

    Future<dynamic> EditJumlahCartBarang(BuildContext context, String id) {
      return showDialog(
        context: context,
        builder: (context) {
          return StreamBuilder<DocumentSnapshot>(
              stream: cart.doc(id).snapshots(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? AlertDialog(
                        backgroundColor: const Color.fromRGBO(130, 130, 168, 1),
                        actions: [
                          Column(
                            children: [
                              TextField(
                                controller: jumlah,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Jumlah",
                                    filled: true,
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    cart
                                        .doc(id)
                                        .update({'jumlah': jumlah.text});
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Selesai",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(89, 87, 138, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Text('Loading....');
              });
        },
      );
    }

    Future<dynamic> CustomAlert(BuildContext context, String id) {
      return showDialog(
        context: context,
        builder: (context) {
          return StreamBuilder<DocumentSnapshot>(
              stream: cart.doc(id).snapshots(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? AlertDialog(
                        backgroundColor: const Color.fromRGBO(130, 130, 168, 1),
                        actions: [
                          Column(
                            children: [
                              TextField(
                                controller: nama,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Nama",
                                    filled: true,
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: alamat,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Alamat",
                                    filled: true,
                                    prefixIcon: Icon(Icons.place)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: no_hp,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "No HP",
                                    filled: true,
                                    prefixIcon: Icon(Icons.phone_android)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // cart.doc(id).update({'type': 'diterima'});
                                    pesanan.add({
                                      "nama_buku":
                                          snapshot.data!.get("nama_buku"),
                                      "alamat": alamat.text,
                                      "nama": nama.text,
                                      "nomor_hp": no_hp.text,
                                      "type": "pengantaran"
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Selesai",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(89, 87, 138, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Text('Loading....');
              });
        },
      );
    }

    return ListView(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: cart.snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Column(
                      children: snapshot.data!.docs
                          .map((e) => ItemCartCard(
                                name: e.get("user_id"),
                                buku: e.get("nama_buku"),
                                jumlah: e.get("jumlah"),
                                onUpdate: () {
                                  CustomAlert(context, e.id);
                                },
                                onDelete: () {
                                  cart.doc(e.id).delete();
                                },
                                onQuantity: () {
                                  EditJumlahCartBarang(context, e.id);
                                },
                              ))
                          .toList())
                  : Container();
            }),
      ],
    );
  }
}
