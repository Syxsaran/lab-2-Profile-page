import 'package:flutter/material.dart';
import 'package:lab1/student.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class DetailPage extends StatelessWidget {
  final Student data;

  const DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Detail Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "image_profile_${data.name}",
                child: ClipOval(
                  child: Image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    image: AssetImage(data.image),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              buildDetailRow("Email: ", data.email),
              buildDetailRow("Date of Birth: ", data.dateOfBirth),
              buildDetailRow("Phone Number: ", data.phoneNumber),
              buildDetailRow("About Me: ", data.aboutMe),
              buildDetailRow("Social Media: ", data.socialMediaLink,
                  isLink: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          isLink
              ? GestureDetector(
                  onTap: () => _launchURL(value),
                  child: Text(
                    "Facebook",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
