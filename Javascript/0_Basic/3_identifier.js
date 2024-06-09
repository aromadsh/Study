// 변수 : 필요에 따라 변할 수 있는 수 (let)
let a = 3;
console.log(a);

a = 10;
console.log(a);

// let a = 4; 이거는 안됨! let을 위에서 한번 선언했기 때문에


// 상수 : 변하지 않는 수 (const)

const B = 10;
console.log(B);

// B = 10; 이거는 안됨! const는 변하지 않는 상수이기 때문에
// const B = 11; 이것 또한 안됨! 위에서 한번 선언했기 때문에


// 메모리 할당

let x = 100;
let y = x;
console.log(x, y) // 100 100 x와 y의 메모리 주소가 같음 (100이 담겨있는 메모리 주소에 x와 y가 함께 위치)

x = "Javascript";
console.log(x, y) // Javascript 100 x와 y의 메모리 주소가 다름 (100이 담겨있는 메모리 주소에는 y, javascript가 담겨있는 메모리 주소에는 x)



