import 'package:flutter/material.dart';

class PartnershipPage extends StatefulWidget {
  const PartnershipPage({Key? key}) : super(key: key);

  @override
  _PartnershipPageState createState() => _PartnershipPageState();
}

class _PartnershipPageState extends State<PartnershipPage> {
  List<Map<String, dynamic>> partnerships = [
    {"name": "Sang Seafood De Meer (Surabaya)", "logo": "assets/SangSeafood.jpg"},
    {"name": "Dragon Hotpot (Surabaya)", "logo": "assets/Dragon.jpg"},
    {"name": "Rumah Makan Indragiri (Surabaya)", "logo": "assets/Indragiri.jpg"},
    {"name": "Layar Seafood (Surabaya)", "logo": "assets/layar.jpg"},
    {"name": "Raja Lobster (Surabaya)", "logo": "assets/Rajalobster.jpg"},
    {"name": "Xiang Fu Hai Cuisine (Surabaya)", "logo": "assets/XiangFuHai.jpg"},
    {"name": "Partner 7", "logo": "assets/lobster.jpg"},
    {"name": "Partner 8", "logo": "assets/lobster.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/header.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Partnership",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Text(
                          "Cari tau tentang partnership kami",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
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
      body:
      Column(
          children: [
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
            Expanded(
              child: GridView.builder(
                padding : const EdgeInsets.all(20.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1,
                ),
                itemCount: partnerships.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPartnerItem(partnerships[index]);
                },
              ),
            ),
          ],
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
      child: Container(
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
      ),
    );
  }

  Widget _buildPartnerItem(Map<String, dynamic> partner) {
    String logoPath = partner['logo'] ?? 'assets/logo.jpg'; // Handle null logo
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(logoPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            partner['name'] ?? 'Unnamed Partner', // Handle null name
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
