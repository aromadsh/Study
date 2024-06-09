// 자바스크립트에는 모든 수치 데이터는 Number 타입
let integer_num = 100;
let float_num = 1.234;
let positive = +100;
let negative = -100;

console.log(integer_num, typeof(integer_num));
console.log(float_num, typeof(float_num));
console.log(positive, typeof(positive));
console.log(negative, typeof(negative));

// 무한대
let infi = 1 / 0;
console.log(infi, typeof(infi));

let neg_infi = -(1/0);
console.log(neg_infi, typeof(neg_infi));

let real_infi = Infinity;
console.log(real_infi, typeof(real_infi));

// Not a Number
let x = 1 / 'abc';
let y = 2 * 'abc';
let z = NaN;
let neg_z = -NaN;

console.log(x, typeof(x));
console.log(y, typeof(y));
console.log(z, typeof(z));
console.log(neg_z, typeof(neg_z));

// NaN 값 확인 방법
let nan_x = 1 / 'abc';
console.log(
    nan_x,                  // NaN 출력
    nan_x == NaN,           // 같은 NaN 값이지만 확인 불가
    nan_x === NaN,          // 같은 NaN 값이지만 확인 불가
    isNaN(nan_x),           // 숫자가 아니면 무조건 True
    Number.isNaN(nan_x)     // 숫자 자료형 True and 숫자가 아니면 True
);

console.log(typeof('1'), isNaN('1'), Number.isNaN('1'));        // (숫자)문자 | isNaN F (숫자O) | Number.isNaN F (형O, 숫자O)
console.log(typeof(true), isNaN(true), Number.isNaN(true));     // (T:1 F:0)불린 | isNaN F (숫자O)| Number.isNaN F (형O, 숫자O)
console.log(typeof('a'), isNaN('a'), Number.isNaN('a'));        // 문자 | isNaN T (숫자X) | Number.isNaN F (형X, 숫자X)
console.log(typeof(1/'a'), isNaN(1/'a'), Number.isNaN(1/'a'));  // NaN | isNaN T (숫자X) | Number.isNaN T (형O, 숫자O)

// 연산자 => 이항 산술 연산자
let num_0 = 10;
let num_1 = num_0 * 10;
console.log(num_0, num_1);

console.log(
    num_0 + 10,     // 덧셈
    num_0 - 10,     // 뺄셈
    num_0 * 10,     // 곱셈
    num_0 / 10,     // 나눗셈
    num_0 % 10,     // 나머지
    num_0 ** 10     // 제곱
);
console.log(num_0); // 부수효과 X

// 연산자 => 단항 산술 연산자
let ten_0 = 10, ten_1 = 10;

console.log(ten_0, ten_0++, ten_0);
console.log(ten_1, ++ten_1, ten_1);

console.log(-ten_0);
console.log(+ten_0);
console.log(ten_0); // 부수효과 X

// 암묵적 문자열을 숫자로 형변환
console.log(
    +'10', typeof(+'10'),  
    -'10', typeof(-'10'),
    +'abc', typeof(+'abc'), //'abc'는 숫자형으로 변환되지만 NaN으로 출력
);

// 할당 산술 연산자 (부수효과 있음)
let num_3 = 10;
console.log(
    num_3 += 10,    // 10 + 10 = 20
    num_3 -= 10,    // 20 - 10 = 10
    num_3 *= 10,    // 10 * 10 = 100
    num_3 /= 10,    // 100 / 10 = 10
    num_3 %= 10,    // 10 % 10 = 0
    num_3 ** 10     // 0 ** 10 = 0
);
console.log(num_3); // 0