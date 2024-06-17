// 블록문
{
    console.log("block");
}

// 스코프
{
    const start = "Hello";
    let end = "wirld!";
    console.log(start, end);
}

// console.log(start, end); // referenceError : 블록안에 있는 변수는 지역 변수로 전역 변수에 영향을 줄 수 없음

// 전역 변수를 지역 변수로 사용하는 경우

let start = "Hello";
let end = "world";

{
    let middle = "JavaScript";
    start = "Hi";
    console.log(start, middle); // Hi JavaScript 출력 let이나 const를 선언하지 않으면 전역변수를 가져옴
}

console.log(start, end); // Hi World 출력 전역변수를 지역 스코프 안에서 수정했기 때문에 변경되어 출력