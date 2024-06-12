// 기본
console.log(true, typeof(true));
console.log(false, typeof(false));

// 연산자 => 부정 연산자
console.log(true, !true, !!true, !!!true, !!!!true);
console.log(false, !false, !!false, !!!false, !!!!false);
console.log(
    true === !false,
    true == !false
);

// AND OR 연산자
console.log(
    true && true,
    true && false,
    false && true,
    false && false
);

console.log(
    true || true,
    true || false,
    false || true,
    false || false,
)

// 드 모르간의 법칙
console.log(
    !(true && true) === (!true || !true),
    !(true || true) === (!true && !true)
)

/*
 * && 연산에서 첫 조건이 false 이면 뒤에 값은 계산을 하지 않음
 * || 연산에서 첫 조건이 true 이면 뒤에 값은 계산을 하지 않음
 * 이것은 간결한 코드를 만들 수 있고 리소스를 절약할 수 있음
 */

let error = true;
// let error = false;
error && console.warn('오류 발생!');
error || console.log('이상 없음.');

// 삼항 연산자
let x = true;
console.log(x ? '참' : '거짓');
let y = x ? '참' : '거짓';
console.log(y);

let err = true;

err
    ? console.log("오류 발생")
    : console.log("이상 없음");

// Truthy와 Falsy

// Truthy
console.log(
    1.23 ? true : false,
    -999 ? true: false,
    '0' ? true : false,
    ' ' ? true : false,
    Infinity ? true : false,
    -Infinity ? true : false,
    {} ? true : false,
    [] ? true : false,
);

// 그렇다고 true는 아님!
console.log(
    1 == true, // true는 1이 기도 함
    1.23 == true,
    ' ' == true,
    {} == true
);

// Falsy
console.log(
    0 ? true : false,
    -0 ? true : false,
    '' ? true : false,
    null ? true : false,
    undefined ? true : false,
    NaN ? true : false,
);

// 💡 어떤 값들은 false로 타입변환됨
console.log(
    0 == false,     // true flase는 0값을 가지기도 함
    0 === false,    // false 그러나 자료형 자체는 불이 아님!
    '' == false,    // true  특수 케이스
    '' === false    // false
);
console.log(
null == false,      // false
undefined == false, // false
NaN == false,       // false
);

// boolean 연산 예시 1
let off = 0;
let on = 1;

off && off++; // 0값은 false라서 && 앞 조건이 false이면 뒤에 연산을 하지 않고 바로 false
on && on++;   // 1값은 true라서 && 앞 조건이 true이면 뒤에 연산을 진행하기 때문에 1이 더해짐
console.log(off, on);

// boolean 연산 예시 2
let odd = 2;
let even = 3;

console.log(
  odd % 2 ? '홀' : '짝', // 나누었을 때 0 값이면 false가 되므로 짝 출력
  even % 2 ? '홀' : '짝' // 나누었을 때 1 값이면 true가 되므로 홀 출력
);

// boolean 연산 예시 3
let empty = '';
let fill = '회사원';
let result = empty || fill; // 공백은 falsy, 문자열은 truthy

console.log(result);

empty = empty || '단기알바'; // '단기알바' 값은 trusy이기 때문에 true 값인 '단기알바' 값 출력
fill = fill || '단기알바';   // '단기알바' 값은 trusy이기 때문에 기존의 true 값인 fill 출력
console.log(empty, fill);

// boolean 연산 예시 4
let ott = 123;

console.log(
  'ott는 홀수인가?',
  !!(ott % 2)
);

// boolean 값을 직접 변환
console.log(!1, typeof(!1));
console.log(!null, typeof(!null));
console.log(!!1, typeof(!!1));
console.log(!!null, typeof(!!null));

