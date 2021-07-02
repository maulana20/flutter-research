import 'package:flutter/material.dart';

class Item extends Object {
  String label;
  String value;

  Item(this.label, this.value);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> classList = [
    Item("Grafika Komputer - A", 'A'),
    Item("Grafika Komputer - B", 'B'),
    Item("Grafika Komputer - C", 'C'),
  ];

  List<Item> scheduleList = [
    Item("25 Februari 2019 [07:00]", '7'),
    Item("25 Februari 2019 [08:00]", '8'),
    Item("25 Februari 2019 [09:00]", '9'),
  ];

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "INPUT PRESENSI KELAS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0096FF), Color(0xff6610f2)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
            image: DecorationImage(
                image: NetworkImage(
                    "https://studio.code.org/v3/assets/3JTlDdT__x1f4EdsaA3MEwlvGhm-Sgzzz-zG-LNupt4/hy_1.png"),
                fit: BoxFit.cover),
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm347-porpla-02-a-01_2.jpg?w=1000&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=ee743aa5d7cd81a824b2640645ec8765"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  buildDropDownMenu("Kelas", Icons.book, classList),
                  buildDropDownMenu("Jadwal", Icons.calendar_today, scheduleList),
                  buildChecked(),
                  buildButtonPhoto(),
                  buildImagePhoto(),
                  buildButtonSave()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDownMenu(String title, IconData iconData, List<Item> list) {
    return DropdownButtonFormField<Item>(
      isExpanded: true,
      decoration: InputDecoration(
        icon: Icon(iconData),
        labelText: title,
      ),
      items: list.map((Item item) {
        return DropdownMenuItem<Item>(
          value: item,
          child: new Text(item.label),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  Widget buildChecked() {
    return CheckboxListTile(
      activeColor: Colors.pink[300],
      contentPadding: EdgeInsets.all(0),
      title: Text(
        "Tambah jadwal baru ?",
        style: TextStyle(fontSize: 12),
      ),
      value: _isChecked,
      onChanged: (_) {
        setState(() => _isChecked = (_isChecked) ? false : true);
      },
    );
  }

  Widget buildButtonPhoto() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        color: Colors.deepOrange[500],
        child: Text('PILIH FOTO KELAS', style: TextStyle(color: Colors.white)),
        shape: StadiumBorder(),
        onPressed: () {},
      ),
    );
  }

  Widget buildImagePhoto() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.freeiconspng.com/uploads/no-image-icon-15.png"),
              fit: BoxFit.none),
        ),
      ),
    );
  }

  Widget buildButtonSave() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        color: Colors.deepOrange[500],
        child: Text('SIMPAN', style: TextStyle(color: Colors.white)),
        shape: StadiumBorder(),
        onPressed: () {},
      ),
    );
  }
}
