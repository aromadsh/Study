// 쉼표 연산자
let x = 1, y = 2, z = 3;
console.log(x, y, z);

// 마지막으로 실행한 연산자만 실행
console.log(
    ++x,
    y+=x,
    z*=y
); // 이렇게 하면 모두 출력
x = 1, y = 2, z = 3;
console.log(
    (
        ++x,
        y+=x,
        z*=y
    )
); // 이렇게 하면 마지막 실행값만 출력

// ?? => null 병합 연산자 (null 또는 undefined 만 ||로 취급)
let n;
n ?? console.log(n, 'x값은 정의되지 않음'); // n은 undefined로 뒤에 출력

n = 0;
n ?? console.log(n, 'x값은 정의되지 않음'); // n은 false로 뒤에 연산이 안됨

n = null;
n ?? console.log(n, 'x값은 정의되지 않음'); // n은 null로 뒤에 출력

n = 1;
n ?? console.log(n, 'x값은 정의되지 않음'); // n은 true로 뒤에 연산이 안됨

let a = false;
let b = 0;
let c = '';
let d = null;
let e;

console.log(
  a ?? '기본값', // false
  b ?? '기본값', // 0
  c ?? '기본값', // 공백
  d ?? '기본값', // null로 기본값 출력
  e ?? '기본값', // undefined로 기본값 출력
);

// 사용 예시
let baby1 = '홍길동';
let baby2; // 아직 이름을 짓지 못함

const nameTag1 = baby1 ?? '1번 아기'; // baby1은 값이 있기 때문에 그대로 출력
const nameTag2 = baby2 ?? '2번 아기'; // baby2는 값이 없기 때문에 뒤에가 출력

console.log(nameTag1, nameTag2);

// 병합 할당 연산자
let zero = 0;
let empty = '';
let nothing = null;

zero ||= 100;
empty &&= '값이 있어야 함';
nothing ??= '기본값';

console.log(zero, empty, nothing);