import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(DoctorAppointmentApp());
}

class DoctorAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationSelector(),
              SizedBox(height: 20),
              SpecialistBanner(),
              SizedBox(height: 20),
              CategorySection(),
              SizedBox(height: 20),
              NearbyMedicalCenters(),
              SizedBox(height: 20),
              DoctorList(),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Locație: Seattle, USA",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.location_on, color: Colors.blue),
      ],
    );
  }
}

class SpecialistBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.network(
            'doctor1.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Căutați doctori specialiști?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Programați o consultație cu un specialist.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final List<String> categories = [
    'Dentistry',
    'Cardiology',
    'Pediatrics',
    'Neurology',
    'Orthopedics',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categorii',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: categories
              .map((category) => Chip(
                    label: Text(category),
                    backgroundColor: Colors.lightBlue[100],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class NearbyMedicalCenters extends StatelessWidget {
  final List<Map<String, String>> centers = [
    {
      'name': 'Sunrise Health Clinic',
      'address': '123 Main St, Seattle, USA',
      'image': 'clinic1.png'
    },
    {
      'name': 'Golden Care Center',
      'address': '456 Elm St, Seattle, USA',
      'image': 'clinic2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Centre medicale apropiate',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          children: centers.map((center) {
            return Card(
              child: ListTile(
                leading: Image.network(center['image']!),
                title: Text(center['name']!),
                subtitle: Text(center['address']!),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. David Patel',
      'specialty': 'Cardiolog',
      'clinic': 'Cardiology Center, USA',
      'image': 'doctor1.png'
    },
    {
      'name': 'Dr. Jessica Turner',
      'specialty': 'Ginecolog',
      'clinic': 'Women’s Clinic, Seattle, USA',
      'image': 'doctor2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Doctori disponibili',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          children: doctors.map((doctor) {
            return Card(
              child: ListTile(
                leading: Image.network(doctor['image']!),
                title: Text(doctor['name']!),
                subtitle: Text(doctor['specialty']!),
                trailing: Icon(Icons.favorite_border),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
