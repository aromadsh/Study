// 비교

// ==, != 값만 비교
console.log(1 == 1, 1 == 2); // true, false
console.log(1 != 1, 1 != 2); // false, true

// ===, !==값과 자료형 비교
console.log(1 === 1, '1' === 1); // true, false
console.log(1 !== 1, '1' !== 1); // false true

// 대소 문자 비교
console.log("hello" == "HELLO"); // false
console.log("hello" === "HELLO"); // false

// 암묵적 타입 변환
console.log(
    '1' == '1', // true
    '1' == 1,   // true => 숫자를 문자로 변환하여 비교
    '1' == 2    // false
);

console.log(
    '1' === '1', // true
    '1' === 1,   // false => 숫자를 문자로 변환하여 비교
    '1' === 2    // false
);

// 문자열 크기 비교 -> 사전순 비교
console.log(
    'ABC' < 'abc',          // true -> 아스키 코드에서 소문자가 더 큼
    'apple' <= 'banana',    // true -> a보다는 z가 큼
    '가나다' > '라마바',     // false -> '가'보다는 '하'가 큼
);

console.log(
    100 > 12,       // 숫자 자체 비교
    '100' > '12',   // 문자로서 첫글자 비교 후 뒷 글자 비교하여 대소 비교
    '100' > 12      // 암묵적으로 숫자가 글자로 바뀌고 문자로서 비교
);

// 연결 => + 연산자 (이항연산자)
let str1 = 'Hello';
let str2 = ' ' + 'World';

console.log(str1);
console.log(str2);

let str3 = str1 + str2;
console.log(str3);
console.log(str3 + '!!!' + ' ' + 'javascript');
// 부수효과는 없음 => 기존 값 변화가 없다는 의미
console.log(str1);
console.log(str2);
console.log(str3);

// 연결 => += 연산자 (할당연산자)
let newStr1 = 'Hello';
newStr1 += ' World';
console.log(newStr1); // 부수 효과 발생

let newStr2 = newStr1 += '~~~';
console.log(newStr2);

// let newStr3 = '헬로' += '월드'; // newStr3가 정의되지 않은 상태에서는 할당 연산자가 적용되지 않는다.
const STR = '헬로';
// STR += '월드'; // const는 상수 특성으로 할당 연산자가 적용되지 않는다.

// 상수 타입은 이러한 방식으로...
const newSTR = "헬로" + "월드" + "자바스크립트";
console.log(newSTR);

// 암묵적인 문자열 반환
let result = 'Hello' + 123 + true;
console.log(result, "|",  typeof(result));

result += null;
result += undefined;
console.log(result, "|",  typeof(result));