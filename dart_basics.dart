// Student: Ikirezi Dorcas
// Reg no:  26932
const String regNo = '26932';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: \ | D = \ | T = \');

  print('');
  countVowels('Ikirezi Dorcas');

  print('');
  print(initials('Ikirezi Dorcas'));
  print(initials(' ana uwase '));
  print(initials(' '));

  print('');
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  print('');
  momoReceiptPrinter();
}

int countVowels(String text) {
  // by I.D.
  int count = 0;
  String lower = text.toLowerCase();
  for (int i = 0; i < lower.length; i++) {
    String char = lower[i];
    if ('aeiou'.contains(char)) {
      count++;
    }
  }
  print('\ has \ vowels');
  return count;
}

String initials(String fullName) {
  // by I.D.
  List<String> parts = fullName.trim().split(RegExp(r'\s+'));
  if (parts.length == 1 && parts[0].isEmpty) {
    return '';
  }
  String result = '';
  for (int i = 0; i < parts.length; i++) {
    result += '\.';
  }
  return result;
}

void drawTriangle(int height) {
  // by I.D.
  if (height <= 0) return;
  for (int i = 1; i <= height; i++) {
    String spaces = ' ' * (height - i);
    String char = (i % 2 != 0) ? '*' : '#';
    String rowChars = char * i;
    print(spaces + rowChars);
  }
}

int momoFee(int amount) {
  // by I.D.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by I.D.
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*****' + phone.substring(8);
}

void momoReceiptPrinter() {
  // by I.D.
  int i = 1;
  int limit = d + 3;
  String phone = '0788123456';
  String masked = maskPhone(phone);
  
  while (i <= limit) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt \ | \ RWF | fee \ RWF | to \');
    i++;
  }
}
