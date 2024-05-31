import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Mengatur tinggi appbar
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10.0), // Padding horizontal 20.0
          child: AppBar(
            backgroundColor: Colors
                .transparent, // Mengatur warna latar belakang appbar menjadi merah
            automaticallyImplyLeading: false, // Menghilangkan tombol back
            flexibleSpace: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        20.0), // Mengatur radius siku pada sudut kiri bawah
                    bottomRight: Radius.circular(
                        20.0), // Mengatur radius siku pada sudut kanan bawah
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/header.jpg'), // Gambar latar belakang
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bekerjasama Membangun Negeri",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          height:
                              10.0), // Spacer antara judul dan teks berikutnya
                      Container(
                        child: Text(
                          "Platform pemesanan Lobster Air Tawar. Lobsterindo adalah perusahaan yang berjalan pada bidang agrikultural yang fokus pada pengembangan budidaya lobster airtawar",
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
      body: Column(
        children: [
          // Column untuk menu
          Container(
            padding: EdgeInsets.all(20.0),
            // color: Colors.blue,
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
          // Column untuk dropdown pemilihan kategori
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.green,
            child: Text(
              'Dropdown Pemilihan Kategori',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Column untuk katalog produk
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Katalog Produk',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: [
                        // Daftar item produk di sini
                        // Contoh:
                        Container(
                          color: Colors.grey,
                          child: Center(child: Text('Produk 1')),
                        ),
                        Container(
                          color: Colors.grey,
                          child: Center(child: Text('Produk 2')),
                        ),
                        Container(
                          color: Colors.grey,
                          child: Center(child: Text('Produk 3')),
                        ),
                        Container(
                          color: Colors.grey,
                          child: Center(child: Text('Produk 4')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String label}) {
    return Container(
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
    );
  }
}
