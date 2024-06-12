/*
 * 정적 타입은 주로 
int a = 3; 과 같이 미리 변수의 담길 데이터의 타입을 선정하는 컴파일형식의 언어

* 동적 타입은 주로
let a = 4; 과 같이 변수에 담길 데이터 타입의 상관없이 값이 입력되고 추후 실행될때 데이터 타입이 정해지는 인터프리터 언어

 * 따라서 정적타입의 언어는 int a = 3; 이라고 선언과 정의를 하면, 이후에 a = "hello";에서 타입에러가 생긴다.
 * 반면에 동적타입의 언어는 let a = 3; 이라고 선언고 정의를 하면, 이후에 a = "hello";에서 잘 실행 된다.
 */
let job = '학생';
let age = 17;

console.log(job, age);
console.log(typeof(age));

age = '열일곱';

console.log(age);
console.log(typeof(age));

// 반면에 동적 타입의 언어의 기본적인 오류
function getUpperCase(str) {
    return str.toUpperCase();
};
console.log(getUpperCase('hello'));

// console.log(getUpperCase(1)); // 오류

console.log(1 + 1, typeof(1+1));
console.log('1' + 1, typeof('1'+1)); // 타입이 변함