import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My English Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GirisSayfasi(),
        '/kelimeler': (context) => const KelimelerSayfasi(),
      },
    );
  }
}

// Giriş Sayfası
class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My English Dictionary'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset(
              'assets/images/pexels-athena-3036757.jpg',  // Resim yolu
              width: 400,  // Genişlik
              height: 400,  // Yükseklik
             ),
            const Text(
              'İngilizce Kelime Öğrenme Uygulaması',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            const Text(
              'Havacılık öğrencileri için hazırlanan İngilizce kelime öğretme platformuna hoş geldiniz. '
              'Üniteleri seçerek kelimelerin anlamlarını öğrenebilir ve telaffuzlarını dinleyebilirsiniz.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade600,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KelimelerSayfasi(),
                  ),
                );
              },
              child: const Text(
                'Başla',
                style: TextStyle(
                  fontSize: 18,
                color: Colors.black,  // Yazının rengini siyah yapıyoruz
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelimeler Sayfası
class KelimelerSayfasi extends StatefulWidget {
  const KelimelerSayfasi({super.key});

  @override
  State<KelimelerSayfasi> createState() => _KelimelerSayfasiState();
}

class _KelimelerSayfasiState extends State<KelimelerSayfasi> {
  FlutterTts flutterTts = FlutterTts();

  final Map<String, List<Map<String, String>>> kelimeler = {
    "Ünite 1: Havacılık Terimleri": [
      {'kelime': 'Altitude', 'anlam': 'Yükseklik'},
      {'kelime': 'Aileron', 'anlam': 'Kanat Düzeltmesi'},
      {'kelime': 'Altitude Control', 'anlam': 'Yükseklik Kontrolü'},
      {'kelime': 'Cockpit', 'anlam': 'Kokpit'},
      {'kelime': 'Turbulence', 'anlam': 'Türbülans'},
      {'kelime': 'Yaw', 'anlam': 'Yaw (Yön Değiştirme)'},
      {'kelime': 'Pitch', 'anlam': 'Pitch (Burulma)'},
      {'kelime': 'Roll', 'anlam': 'Roll (Dönme)'},
      {'kelime': 'Glide', 'anlam': 'Kayma'},
      {'kelime': 'Stall', 'anlam': 'İniş Yaparken Motorun Durması'},
    ],
    "Ünite 2: Uçuş Bilgileri": [
      {'kelime': 'Jetstream', 'anlam': 'Jet Akımı'},
      {'kelime': 'Radar', 'anlam': 'Radar Sistemi'},
      {'kelime': 'Runway', 'anlam': 'Pist'},
      {'kelime': 'Taxiway', 'anlam': 'Taksi Yolu'},
      {'kelime': 'Flight Path', 'anlam': 'Uçuş Yolu'},
      {'kelime': 'Landing', 'anlam': 'İniş'},
      {'kelime': 'Takeoff', 'anlam': 'Kalkış'},
      {'kelime': 'Waypoint', 'anlam': 'Rota Noktası'},
      {'kelime': 'Altitude Restriction', 'anlam': 'Yükseklik Kısıtlaması'},
      {'kelime': 'Glide Slope', 'anlam': 'İniş Eğrisi'},
    ],
    "Ünite 3: Havaalanı Terimleri": [
      {'kelime': 'Runway', 'anlam': 'Pist'},
      {'kelime': 'Taxiway', 'anlam': 'Taksi Yolu'},
      {'kelime': 'Check-in', 'anlam': 'Biniş Kontrolü'},
      {'kelime': 'Baggage Claim', 'anlam': 'Bagaj Teslimi'},
      {'kelime': 'Control Tower', 'anlam': 'Kontrol Kulesi'},
      {'kelime': 'Departure', 'anlam': 'Kalkış'},
      {'kelime': 'Arrival', 'anlam': 'Varış'},
      {'kelime': 'Runway Lights', 'anlam': 'Pist Işıkları'},
      {'kelime': 'Customs', 'anlam': 'Gümrük'},
      {'kelime': 'Duty-Free', 'anlam': 'Vergisiz Mağaza'},
    ],
    "Ünite 4: Uçak Sistemleri": [
      {'kelime': 'Engine', 'anlam': 'Motor'},
      {'kelime': 'Landing Gear', 'anlam': 'İniş Takımları'},
      {'kelime': 'Fuel Tank', 'anlam': 'Yakıt Deposu'},
      {'kelime': 'Flaps', 'anlam': 'Flaplar'},
      {'kelime': 'Navigation System', 'anlam': 'Navigasyon Sistemi'},
      {'kelime': 'Cockpit Instruments', 'anlam': 'Kokpit Aletleri'},
      {'kelime': 'Fuel Pump', 'anlam': 'Yakıt Pompası'},
      {'kelime': 'Pitot Tube', 'anlam': 'Pitot Tüpü'},
      {'kelime': 'Tail', 'anlam': 'Kuyruk'},
      {'kelime': 'Fuselage', 'anlam': 'Gövde'},
    ],
    "Ünite 5: Uçuş Güvenliği": [
      {'kelime': 'Emergency Exit', 'anlam': 'Acil Çıkış'},
      {'kelime': 'Life Vest', 'anlam': 'Can Yeleği'},
      {'kelime': 'Seatbelt', 'anlam': 'Emniyet Kemeri'},
      {'kelime': 'Oxygen Mask', 'anlam': 'Oksijen Maskesi'},
      {'kelime': 'First Aid Kit', 'anlam': 'İlk Yardım Seti'},
      {'kelime': 'Fire Extinguisher', 'anlam': 'Ateş Söndürücü'},
      {'kelime': 'Safety Instructions', 'anlam': 'Güvenlik Talimatları'},
      {'kelime': 'Life Raft', 'anlam': 'Can Salı'},
      {'kelime': 'Crash Landing', 'anlam': 'Acil İniş'},
      {'kelime': 'Evacuation', 'anlam': 'Tahliye'},
    ],
  };

  void speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üniteler'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: kelimeler.keys.map((unite) {
            return Card(
              margin: const EdgeInsets.all(10),
              color: Colors.teal.shade50,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  unite,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
                tileColor: Colors.teal.shade100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KelimeDetaySayfasi(
                        unite: unite,
                        kelimeler: kelimeler[unite]!,
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Kelime Detay Sayfası
class KelimeDetaySayfasi extends StatelessWidget {
  final String unite;
  final List<Map<String, String>> kelimeler;

  const KelimeDetaySayfasi({super.key, required this.unite, required this.kelimeler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(unite),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
      ),
      body: ListView.builder(
        itemCount: kelimeler.length,
        itemBuilder: (context, index) {
          var kelime = kelimeler[index];
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.teal.shade50,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                kelime['kelime']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal.shade800),
              ),
              subtitle: Text(kelime['anlam']!, style: TextStyle(color: Colors.teal.shade600)),
              trailing: IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.teal),
                onPressed: () {
                  FlutterTts().speak(kelime['kelime']!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


