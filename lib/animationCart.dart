import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Bai2 extends StatefulWidget {
  const Bai2({super.key});

  @override
  State<Bai2> createState() => _Bai2State();
}

double total = 0;

class _Bai2State extends State<Bai2> {
  final List<TextEditingController> _controllerProduct =
      <TextEditingController>[];
  List<MatHang> dsMatHang = <MatHang>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "List of Product",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            height: 50.0,
            width: double.infinity,
            child: const Text(
              'ĐẶT HÀNG',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: Random().nextInt(30),
              itemBuilder: (context, index) {
                _controllerProduct.add(TextEditingController());
                dsMatHang.add(
                    MatHang("Mặt Hàng $index", Random().nextInt(10000), 0));
                _controllerProduct[index].text =
                    dsMatHang[index].soLuong.toString();
                Color color =
                    Colors.primaries[index % Colors.primaries.length];
                double opacity = dsMatHang[index].soLuong == 0
                    ? 0.2
                    : min(1.0, dsMatHang[index].soLuong / 10);
                color = color.withOpacity(opacity);
                return Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 5),
                  decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              dsMatHang[index].tenMonHang,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                                "Đơn giá: ${dsMatHang[index].donGia.toString()}"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  label: Text(
                                    'Số lượng',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                controller: _controllerProduct[index],
                                onChanged: (value) => setState(
                                  () {
                                    dsMatHang[index].soLuong =
                                        int.tryParse(value) ?? 0;
                                    try {
                                      for (int i = 0;
                                          i < dsMatHang.length;
                                          i++) {
                                        total += dsMatHang[i].totalPrice();
                                      }
                                      // ignore: empty_catches
                                    } catch (e) {}
                                    if (dsMatHang[index].soLuong > 0) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Đã chọn: ${dsMatHang[index].tenMonHang} \n Số lượng: ${dsMatHang[index].soLuong}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            height: 80.0,
            width: double.infinity,
            child: Text(
              'Thành tiền: $total',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          color: Colors.white,
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Thông báo"),
              content: const Text("Xác nhận đơn hàng"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, "Hủy"),
                  child: const Text("Hủy"),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DatHangPage(listProducts: dsMatHang),
                    ),
                  ),
                  child: const Text("Ok"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MatHang {
  String tenMonHang;
  int donGia;
  int soLuong;

  MatHang(this.tenMonHang, this.donGia, this.soLuong);

  double totalPrice() {
    double tong = (soLuong * donGia).toDouble();
    return tong;
  }
}

class DatHangPage extends StatelessWidget {
  const DatHangPage({super.key, required this.listProducts});
  final List<MatHang> listProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Dat Hang Page",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          listProducts.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: listProducts.length,
                    itemBuilder: (context, index) {
                      if (listProducts[index].soLuong > 0) {
                        return Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomListItem(matHang: listProducts[index]),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                )
              : const Text('No product added'),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            height: 80.0,
            width: double.infinity,
            child: Text(
              'Tổng tiền: $total',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final MatHang matHang;

  const CustomListItem({super.key, required this.matHang});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              color: Colors.blue.withOpacity(0.1),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên mặt hàng: ${matHang.tenMonHang}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Đơn giá: ${matHang.donGia}'),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.green.withOpacity(0.1),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số lượng: ${matHang.soLuong}'),
                  Text('Thành tiền: ${matHang.totalPrice()}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
