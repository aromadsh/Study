const a = true, b = 123.45, c = "안녕하세요!";

// typeof 자료형의 타입을 알아보는 함수

console.log(a, typeof(a));
console.log(b, typeof(b));
console.log(c, typeof(c));

let d;
console.log(d, typeof(d));

d = null;
console.log(d, typeof(d));

const e = Symbol('hello');
console.log(e, typeof(e)); // 이건 나중에

// 불리언
let isEmployed = true;
let isMarried = false;

console.log('직업 있음:', isEmployed);
console.log('기혼:', isMarried);

const t = 1 > 2;
const f = 1 < 2;

console.log(t, typeof(t));
console.log(f, typeof(f));

// 숫자
let integer = 100;
let real = 12.34;
let negative = -99;

console.log(integer, real, negative);

// 문자열
let first_name = "Brendan";
let last_name = 'Eich';
let description = `미국의 프로그래머로
자바스크립트 언어를 만들었으며
모질라의 CEO와 CTO를 역임했다.`;

console.log(first_name, last_name);
console.log(description);

console.log(
    typeof (typeof(true)),
    typeof (typeof(123.45)),
    typeof (typeof('Hello')),
  );

//   undefined : 값이 부여되지 않은 상태라는 것을 의미
let x;
console.log(typeof x);

// NULL : 의도적인 빈 값 
let y;
console.log('값 넣기 전', typeof(y));

y = null;
console.log('null값 넣은 후', typeof(y));

let u = 1;
console.log('변경 전', u);

u = null;
console.log('변경 후', u);

let tt = null;
console.log(typeof null, typeof(tt));

// null 여부는 아래와 같이 확인할 것
console.log(tt === null);