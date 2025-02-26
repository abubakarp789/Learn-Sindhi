import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(SindhiLearningApp());
}

class SindhiLearningApp extends StatelessWidget {
  const SindhiLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Sindhi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SentenceListScreen(),
    );
  }
}

class Sentence {
  final String english;
  final String sindhi;
  final String audioPath;

  Sentence({required this.english, required this.sindhi, required this.audioPath});
}

class SentenceListScreen extends StatefulWidget {
  const SentenceListScreen({super.key});

  @override
  _SentenceListScreenState createState() => _SentenceListScreenState();
}

class _SentenceListScreenState extends State<SentenceListScreen> {
  final AudioPlayer _player = AudioPlayer();

  final List<Sentence> sentences = [ 
    Sentence(english: 'Hello', sindhi: 'سلام', audioPath: 'assets/audio/hello.mp3'),
    Sentence(english: 'Good morning', sindhi: 'صبح جو سلام', audioPath: 'assets/audio/good_morning.mp3'),
    Sentence(english: 'Good afternoon', sindhi: 'منجهند جو سلام', audioPath: 'assets/audio/good_afternoon.mp3'),
    Sentence(english: 'Good evening', sindhi: 'شام جو سلام', audioPath: 'assets/audio/good_evening.mp3'),
    Sentence(english: 'Good night', sindhi: 'رات جو سلام', audioPath: 'assets/audio/good_night.mp3'),
    Sentence(english: 'How are you?', sindhi: 'تون ڪيئن آهين؟', audioPath: 'assets/audio/how_are_you.mp3'),
    Sentence(english: 'I am fine', sindhi: 'آئون ٺيڪ آهيان', audioPath: 'assets/audio/i_am_fine.mp3'),
    Sentence(english: 'Thank you', sindhi: 'مهرباني', audioPath: 'assets/audio/thank_you.mp3'),
    Sentence(english: 'You\'re welcome', sindhi: 'توهان کي ڀليڪار', audioPath: 'assets/audio/you_are_welcome.mp3'),
    Sentence(english: 'Please', sindhi: 'مهرباني ڪري', audioPath: 'assets/audio/please.mp3'),
    Sentence(english: 'Excuse me', sindhi: 'معاف ڪريو', audioPath: 'assets/audio/excuse_me.mp3'),
    Sentence(english: 'I am sorry', sindhi: 'مون کي افسوس آهي', audioPath: 'assets/audio/im_sorry.mp3'),
    Sentence(english: 'Yes', sindhi: 'ها', audioPath: 'assets/audio/yes.mp3'),
    Sentence(english: 'No', sindhi: 'نه', audioPath: 'assets/audio/no.mp3'),
    Sentence(english: 'What is your name?', sindhi: 'توهان جو نالو ڇا آهي؟', audioPath: 'assets/audio/whats_your_name.mp3'),
    Sentence(english: 'My name is...', sindhi: 'منهنجو نالو...', audioPath: 'assets/audio/my_name_is.mp3'),
    Sentence(english: 'Where are you from?', sindhi: 'توهان ڪٿان جا آهيو؟', audioPath: 'assets/audio/where_are_you_from.mp3'),
    Sentence(english: 'I am from...', sindhi: 'مان ... مان آهيان', audioPath: 'assets/audio/i_am_from.mp3'),
    Sentence(english: 'How old are you?', sindhi: 'توهان جي عمر ڪيتري آهي؟', audioPath: 'assets/audio/how_old_are_you.mp3'),
    Sentence(english: 'I am ... years old', sindhi: 'مان ... سالن جو آهيان', audioPath: 'assets/audio/i_am_years_old.mp3'),
    Sentence(english: 'Do you speak English?', sindhi: 'ڇا توهان انگريزي ڳالهائيندا آهيو؟', audioPath: 'assets/audio/do_you_speak_english.mp3'),
    Sentence(english: 'I don not understand', sindhi: 'مان نه سمجهيو', audioPath: 'assets/audio/i_dont_understand.mp3'),
    Sentence(english: 'Can you help me?', sindhi: 'ڇا توهان منهنجي مدد ڪري سگهو ٿا؟', audioPath: 'assets/audio/can_you_help_me.mp3'),
    Sentence(english: 'Where is the restroom?', sindhi: 'باٿ روم ڪٿي آهي؟', audioPath: 'assets/audio/where_is_restroom.mp3'),
    Sentence(english: 'How much does this cost?', sindhi: 'هن جي قيمت ڪيتري آهي؟', audioPath: 'assets/audio/how_much_cost.mp3'),
    Sentence(english: 'What time is it?', sindhi: 'وقت ڇا ٿيو آهي؟', audioPath: 'assets/audio/what_time.mp3'),
    Sentence(english: 'I am hungry', sindhi: 'مان بکايل آهيان', audioPath: 'assets/audio/i_am_hungry.mp3'),
    Sentence(english: 'I am thirsty', sindhi: 'مان اڃايل آهيان', audioPath: 'assets/audio/i_am_thirsty.mp3'),
    Sentence(english: 'Where is the nearest hospital?', sindhi: 'ويجهو اسپتال ڪٿي آهي؟', audioPath: 'assets/audio/nearest_hospital.mp3'),
    Sentence(english: 'Call the police', sindhi: 'پوليس کي سڏيو', audioPath: 'assets/audio/call_police.mp3'),
    Sentence(english: 'I need a doctor', sindhi: 'مون کي ڊاڪٽر جي ضرورت آهي', audioPath: 'assets/audio/need_doctor.mp3'),
    Sentence(english: 'Can I use your phone?', sindhi: 'ڇا مان توهان جو فون استعمال ڪري سگهان ٿو؟', audioPath: 'assets/audio/use_phone.mp3'),
    Sentence(english: 'What is this?', sindhi: 'هي ڇا آهي؟', audioPath: 'assets/audio/what_is_this.mp3'),
    Sentence(english: 'I like it', sindhi: 'مون کي هي پسند آهي', audioPath: 'assets/audio/i_like_it.mp3'),
    Sentence(english: 'I don not like it', sindhi: 'مون کي هي پسند ناهي', audioPath: 'assets/audio/i_dont_like_it.mp3'),
    Sentence(english: 'Where do you live?', sindhi: 'توهان ڪٿي رهندا آهيو؟', audioPath: 'assets/audio/where_do_you_live.mp3'),
    Sentence(english: 'I live in ...', sindhi: 'مان ... ۾ رهندو آهيان', audioPath: 'assets/audio/i_live_in.mp3'),
    Sentence(english: 'What do you do?', sindhi: 'توهان ڇا ڪندا آهيو؟', audioPath: 'assets/audio/what_do_you_do.mp3'),
    Sentence(english: 'I am a student', sindhi: 'مان هڪ شاگرد آهيان', audioPath: 'assets/audio/i_am_student.mp3'),
    Sentence(english: 'I am a teacher', sindhi: 'مان هڪ استاد آهيان', audioPath: 'assets/audio/i_am_teacher.mp3'),
    Sentence(english: 'Nice to meet you', sindhi: 'توهان سان ملي ڪري خوشي ٿي', audioPath: 'assets/audio/nice_to_meet_you.mp3'),
    Sentence(english: 'Goodbye', sindhi: 'خدا حافظ', audioPath: 'assets/audio/goodbye.mp3'),
    Sentence(english: 'See you later', sindhi: 'پوءِ ملنداسين', audioPath: 'assets/audio/see_you_later.mp3'),
    Sentence(english: 'Take care', sindhi: 'خيال رکجو', audioPath: 'assets/audio/take_care.mp3'),
    Sentence(english: 'What are you doing?', sindhi: 'توهان ڇا ڪري رهيا آهيو؟', audioPath: 'assets/audio/what_are_you_doing.mp3'),
    Sentence(english: 'I am working', sindhi: 'مان ڪم ڪري رهيو آهيان', audioPath: 'assets/audio/i_am_working.mp3'),
    Sentence(english: 'I am studying', sindhi: 'مان پڙهي رهيو آهيان', audioPath: 'assets/audio/i_am_studying.mp3'),
    Sentence(english: 'Can I ask you a question?', sindhi: 'ڇا مان توهان کان هڪ سوال پڇي سگهان ٿو؟', audioPath: 'assets/audio/can_i_ask_you_question.mp3'),
    Sentence(english: 'What is your phone number?', sindhi: 'توهان جو فون نمبر ڇا آهي؟', audioPath: 'assets/audio/what_your_number.mp3'),
    Sentence(english: 'Where are you going?', sindhi: 'توهان ڪٿي وڃي رهيا آهيو؟', audioPath: 'assets/audio/where_you_going.mp3'),
  ];


  Future<void> _playAudio(String path) async {
    try {
      await _player.setAsset(path);
      _player.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learn Sindhi')),
      body: ListView.builder(
        itemCount: sentences.length,
        itemBuilder: (context, index) {
          final sentence = sentences[index];
          return ListTile(
            title: Text(sentence.english),
            subtitle: Text(sentence.sindhi, style: TextStyle(fontSize: 18)),
            trailing: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => _playAudio(sentence.audioPath),
            ),
          );
        },
      ),
    );
  }
}
