import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BudidayaPage extends StatefulWidget {
  const BudidayaPage({Key? key}) : super(key: key);

  @override
  _BudidayaPageState createState() => _BudidayaPageState();
}

class _BudidayaPageState extends State<BudidayaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Mengatur tinggi appbar
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0), // Padding horizontal 20.0
          child: AppBar(
            backgroundColor: Colors.transparent, // Mengatur warna latar belakang appbar menjadi merah
            automaticallyImplyLeading: false, // Menghilangkan tombol back
            flexibleSpace: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0), // Mengatur radius siku pada sudut kiri bawah
                    bottomRight: Radius.circular(20.0), // Mengatur radius siku pada sudut kanan bawah
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/header.jpg'), // Gambar latar belakang
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sebarkan budidaya lobster airtawar di indonesia",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0), // Spacer antara judul dan teks berikutnya
                      Container(
                        child: Text(
                          "Lobster air tawar adalah salah satu komoditas baru di indonesia yang memiliki potensi cukup besar untuk berkembang di pasar global",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, // Warna teks putih
                            fontSize: 10.0, // Ukuran teks
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Column untuk menu
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuItem(
                          icon: Icons.home,
                          label: 'Home',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildMenuItem(
                          icon: Icons.business,
                          label: 'Partnership',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildMenuItem(
                          icon: Icons.agriculture,
                          label: 'Budidaya',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String label}) {
    return GestureDetector(
    onTap: () {
      if (label == 'Home') {
        Navigator.pushNamed(context, '/landing');
      } else if (label == 'Partnership') {
        Navigator.pushNamed(context, '/partnership');
      } else if (label == 'Budidaya') {
        Navigator.pushNamed(context, '/budidaya');
      }
    },
    child:   Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 57, 57),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30.0,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          SizedBox(height: 5.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    ));
  }
}