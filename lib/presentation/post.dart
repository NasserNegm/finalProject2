import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final ImagePicker _pciker = ImagePicker();
  XFile? _pickedFile;
  VideoPlayerController? _videoPlayerController;
  late AudioPlayer _audioPlayer;
  bool isAudioPlaying = false;
  String? _pickFilepath;

  Future<void> pickeImage() async {
    final XFile? image = await _pciker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      _pickedFile = image;
      _disposePost();
    }
  }

  Future<void> pickVideo() async {
    final XFile? video = await _pciker.pickImage(source: ImageSource.gallery);
    if (video != null) {
      _videoPlayerController = VideoPlayerController.file(File(video.path))
        ..initialize().then((v) {
          _pickedFile = video;
        });
      _videoPlayerController!.play();
    }
  }

  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      final FilePath = result.files.single.path;
      setState(() {
        _pickFilepath = FilePath;
        print('file : $_pickFilepath ');
      });
      await _audioPlayer.setAudioSource(AudioSource.file(FilePath!)).then((v) {
        _audioPlayer.play();
        print("audio is Playing ");
      });
      setState(() {
        isAudioPlaying = true;
      });
    }
  }

  void _disposePost() {
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    if (_audioPlayer != null) {
      _audioPlayer.dispose();
      isAudioPlaying = false;
    }
  }

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _disposePost();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          // backgroundColor: Colors.black,
          title: Text(
            'Post to'.tr(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Post'.tr(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(children: [
            if (_pickedFile != null)
              _videoPlayerController != null
                  ? SizedBox(
                      height: 200,
                      width: 100,
                      child: VideoPlayer(_videoPlayerController!),
                    )
                  : Image.file(File(_pickedFile!.path)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (pickeImage), child: Text('Pick Image'.tr())),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (pickVideo), child: Text('Pick Video'.tr())),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (pickAudio), child: Text('Pick Audio'.tr())),
          ]),
        ));
  }
}
