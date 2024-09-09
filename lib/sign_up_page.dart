import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  Color _backgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    _focusNode1.addListener(() {
      setState(() {
        _backgroundColor = _focusNode1.hasFocus
            ? Color(0xFF3273B8).withOpacity(0.1)
            : Colors.transparent;
      });
    });

    _focusNode2.addListener(() {
      setState(() {
        _backgroundColor = _focusNode2.hasFocus
            ? Color(0xFF3273B8).withOpacity(0.1)
            : Colors.transparent;
      });
    });

    _focusNode3.addListener(() {
      setState(() {
        _backgroundColor = _focusNode3.hasFocus
            ? Color(0xFF3273B8).withOpacity(0.1)
            : Colors.transparent;
      });
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    String id = _idController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (id.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('모든 필드를 입력해 주세요.');
      return;
    }

    if (password != confirmPassword) {
      _showErrorDialog('비밀번호가 일치하지 않습니다.');
      return;
    }

    _showSuccessDialog('회원가입이 완료되었습니다!');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('오류'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('성공'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Color(0xFF181A20),
      ),
      backgroundColor: Color(0xFF181A20),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '아이디',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF9EA3B2),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _idController,
              focusNode: _focusNode1,
              decoration: InputDecoration(
                filled: true,
                fillColor: _focusNode1.hasFocus
                    ? _backgroundColor
                    : Colors.transparent,
                hintText: '아이디를 입력해 주세요',
                hintStyle: TextStyle(fontSize: 18, color: Color(0xFF9EA3B2)),
                contentPadding: EdgeInsets.fromLTRB(30.0, 14.0, 0, 14.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xFF3273B8)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              '비밀번호',
              style: TextStyle(fontSize: 18, color: Color(0xFF9EA3B2)),
            ),
            SizedBox(height: 6),
            TextField(
              controller: _passwordController,
              focusNode: _focusNode2,
              decoration: InputDecoration(
                filled: true,
                fillColor: _focusNode2.hasFocus
                    ? _backgroundColor
                    : Colors.transparent,
                hintText: '비밀번호를 입력해 주세요',
                hintStyle: TextStyle(fontSize: 18, color: Color(0xFF9EA3B2)),
                contentPadding: EdgeInsets.fromLTRB(30.0, 14.0, 0, 14.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xFF3273B8)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              '재입력',
              style: TextStyle(fontSize: 18, color: Color(0xFF9EA3B2)),
            ),
            SizedBox(height: 6),
            TextField(
              controller: _confirmPasswordController,
              focusNode: _focusNode3,
              decoration: InputDecoration(
                filled: true,
                fillColor: _focusNode3.hasFocus
                    ? _backgroundColor
                    : Colors.transparent,
                hintText: '비밀번호를 재입력해 주세요',
                hintStyle: TextStyle(fontSize: 18, color: Color(0xFF9EA3B2)),
                contentPadding: EdgeInsets.fromLTRB(30.0, 14.0, 0, 14.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xFF3273B8)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3273B8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _signUp,
                child: Text(
                  '회원가입',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: RichText(
                text: TextSpan(
                  text: '이미 회원이신가요?   ',
                  style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: '로그인',
                      style: TextStyle(
                        color: Color(0xFF3273B8),
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // 로그인 페이지로 이동
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}