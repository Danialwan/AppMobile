import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? _selectedBranch; // Variable to hold the selected branch

  // List of branches
  final List<String> _branches = [
    'Jl. Tambak Medokan Ayu (Surabaya)',
    'Jl. Menur 2/2c (Surabaya)',
    'Jl. Kedungpring (Lamongan)',
  ];

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
                        "Bekerjasama Membangun Negeri",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0), // Spacer antara judul dan teks berikutnya
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
            // Column untuk dropdown pemilihan kategori
            Container(
              padding: EdgeInsets.all(10.0),
              width: 350,
              color: Colors.white,
              child: DropdownButton<String>(
                value: _selectedBranch,
                hint: Text(
                  'Pilih Cabang',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dropdownColor: Colors.red[400],
                icon: Icon(Icons.arrow_downward, color: Colors.white),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.white),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBranch = newValue;
                  });
                },
                items: _branches.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Column untuk katalog produk
            Padding(
              padding: EdgeInsets.all(20.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return _buildProductItem('Lobster Air Tawar Konsumsi', 'Rp ${100000 * (index + 1)}');
                },
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

  Widget _buildProductItem(String name, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/lobster.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            price,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}