import 'package:flutter/material.dart';
import 'package:lab1/DetailPage.dart';
import 'package:lab1/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 54, 117, 244)),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student(
        name: "ศรันย์ ซุ่นเส้ง",
        studentid: "643450086-6",
        image: "images/ศรันย์ ซุ่นเส้ง.jpg",
        email: "Saran.sunsang55@gmail.com",
        dateOfBirth: "12 DEC 2002",
        phoneNumber: "0841264702",
        aboutMe: "I'm tall and love to eat",
        socialMediaLink:
            "https://www.facebook.com/profile.php?id=100012787714925",
      ),
      Student(
        name: "ก้องภพ ตาดี",
        studentid: "643450321-2",
        image: "images/ก้องภพ ตาดี.jpg",
        email: "ก้องภพ ตาดี@gmail.com",
        dateOfBirth: "22 June 2002",
        phoneNumber: "0895556325",
        aboutMe: "I'm tall and love drink",
        socialMediaLink: "https://www.facebook.com/kongphop.tadee",
      ),
      Student(
        name: "ชาญณรงค์ แต่งเมือง",
        studentid: "643450069-6",
        image: "images/ชาญณรงค์ แต่งเมือง.jpg",
        email: "ชาญณรงค์ แต่งเมือง@gmail.com",
        dateOfBirth: "11 Feb 2002",
        phoneNumber: "0896325894",
        aboutMe: "I love football",
        socialMediaLink: "https://www.facebook.com/jiab.channarong.10",
      ),
      Student(
        name: "กมล จันบุตรดี",
        studentid: "643450063-8",
        image: "images/กมล จันบุตรดี.jpg",
        email: "กมล จันบุตรดี@gmail.com",
        dateOfBirth: "1 Sept 2002",
        phoneNumber: "0857469521",
        aboutMe: "I love running",
        socialMediaLink:
            "https://www.facebook.com/profile.php?id=100008572876637",
      ),
      Student(
        name: "นภัสสร ดวงจันทร์",
        studentid: "643450326-2",
        image: "images/นภัสสร ดวงจันทร์.jpg",
        email: "นภัสสร ดวงจันทร์@gmail.com",
        dateOfBirth: "22 Feb 2002",
        phoneNumber: "0856324587",
        aboutMe: "I love cafe",
        socialMediaLink:
            "https://www.facebook.com/profile.php?id=100013366607167",
      ),
      Student(
        name: "เจษฏา พบสมัย",
        studentid: "643450323-8",
        image: "images/เจษฏา พบสมัย.jpg",
        email: "เจษฏา พบสมัย@gmail.com",
        dateOfBirth: "3 May 2002",
        phoneNumber: "0895236336",
        aboutMe: "I love art",
        socialMediaLink: "https://www.facebook.com/chetsada.phobsamai.9",
      ),
      Student(
        name: "ประสิทธิชัย จันทร์สม",
        studentid: "643450079-3",
        image: "images/ประสิทธิชัย จันทร์สม.jpg",
        email: "ประสิทธิชัย จันทร์สม@gmail.com",
        dateOfBirth: "3 Jul 2002",
        phoneNumber: "0899995689",
        aboutMe: "I love IOT",
        socialMediaLink:
            "https://www.facebook.com/profile.php?id=100069065683019",
      ),
      Student(
        name: "สุธาดา เสนามงคล",
        studentid: "643450089-0",
        image: "images/สุธาดา เสนามงคล.jpg",
        email: "สุธาดา เสนามงคล@gmail.com",
        dateOfBirth: "25 Oct 2002",
        phoneNumber: "0856324521",
        aboutMe: "I love cookie",
        socialMediaLink: "https://www.facebook.com/hisuthada",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My App"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return displayItem(context: context, student: datas[index]);
        },
      ),
    );
  }

  Widget displayItem(
      {required BuildContext context, required Student student}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(data: student),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: "image_profile_${student.name}",
              child: Image(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                image: AssetImage(student.image),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    student.studentid,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
