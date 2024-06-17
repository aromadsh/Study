// if 문
if (true) {
    console.log("사랑해요~");
} 

// if ~ else 문

let boo = false;

if (boo) { 
    console.log("참"); 
 } else {
    console.log("거짓");
 }

//  if ~ else if 문
 
let num = 5;

if (num % 2 == 0) {
    console.log("짝수");
} else if (num % 2 !== 0) {
    console.log("홀수");
} else {
    console.log("0");
}

// 중첩
num = 354;
if (num % 2) {
    if (String(num).length < 2) {
        console.log("1자리 수 홀수");
    } else {
        console.log("2자리 수 이상 홀수");
    }
} else {
    if (String(num).length < 2) {
        console.log("1자리 수 짝수");
    } else {
        console.log("2자리 수 이상 짝수");
    }
}

// 함수 if 방식

const odd_even = (num) => {
    if (num % 2) {
        return "홀수";
    } else {
        return "짝수";
    }
}

let x = odd_even(21);
console.log(x);