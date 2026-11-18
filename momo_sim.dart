// Student: Ikirezi Dorcas
// Reg no:  26932
const String regNo = '26932';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print('\n--- Testing isValidPin ---');
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('4821$d: ${isValidPin('4821$d')}');

  int balance = 20000 + t * 500;
  print('\nStarting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print('\n--- Additional Tests ---');
  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(-5000));
  print(formatRwf(1250000));
  print(isValidPin('98765'));
}

int momoFee(int amount) {
  // by I.D.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by I.D.
  if (amount == 0) return '0 RWF';
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  if (isNegative) {
    result = '-' + result;
  }
  return '$result RWF';
}

bool isValidPin(String pin) {
  // by I.D.
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    String char = pin[i];
    if (char.codeUnitAt(0) < '0'.codeUnitAt(0) || char.codeUnitAt(0) > '9'.codeUnitAt(0)) {
      return false;
    }
    if (char != pin[0]) {
      allSame = false;
    }
    i++;
  }
  if (allSame) return false;
  return true;
}

int sendMoney(int balance, int amount) {
  // by I.D.
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by I.D.
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance for airtime');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}
