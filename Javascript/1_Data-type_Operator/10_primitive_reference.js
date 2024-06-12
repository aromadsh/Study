// 원시 타입
// 값 자체를 복사하며, 값이 바뀌었을 때는 원래 변수에 담긴 값이 변경되지 않음
let number1 = 123;
let string1 = 'ABC';
let bool1 = true;

let number2 = number1;
let string2 = string1;
let bool2 = bool1;

number2 = 2;
string2 = '가나다';
bool2 = false;

console.log('~1:', number1, string1, bool1);
console.log('~2:', number2, string2, bool2);

// 참조 타입
// 값이 담긴 주소값을 복사하며, 값이 바뀌었을 때는 원래 변수에 담긴 값이 변경됨
const obj1 = {
    num: 1, 
    str: 'ABC', 
    bool: true
};
const obj2 = obj1;

console.log('obj1:', obj1);
console.log('obj2:', obj2);

obj2.num = 2;
obj2.str = '가나다';
obj2.bool = false;

console.log('obj1:', obj1);
console.log('obj2:', obj2);

// 배열도 마찬가지
const array1 = [1, 'ABC', true];
const array2 = array1;

array2[0] = 3;
array2[1] = 'def';
array2[2] = false;

console.log('array1:', array1);
console.log('array2:', array2);