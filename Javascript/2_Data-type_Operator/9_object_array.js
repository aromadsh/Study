// 객체 -> property 자료형( key : value ) 형태
// key값은 따옴표를 사용해도 되고 안해도 됨
// value값에는 문자 값일 경우 따옴표를 사용해야만 함
const information = {
    id: 1,
    name: "Coba",
    age: 20,
    sex: "male"
};

console.log(typeof(information));
console.log(information);

// 프로퍼티 내 속성값 접근
console.log(
    information.name,
    information['sex'],
);

console.log(information.birth); // 존재 하지 않는 키값은 undefined

// 객체 내의 키값 존재 여부 확인
console.log(
    'age' in information,
    'address' in information
);

// 프로퍼티(객체) 수정 및 추가
information.id = 0;             // 수정
information['age'] = 27;
information.birth = '0123';     // 추가
information.address = 'Seoul';
console.log(information);

// 배열
const data = ['python', 'R', 'SQL'];
const size = [25.5, 81.7, 296.1];
console.log(data, size);

// 배열 요소 값 접근
console.log(data[1]);
console.log(size[1]);
console.log(data[data.length-1]);
console.log(size[size.length]); // 존재하지 않는 인덱스로서 undefined 출력

// 배열 길이 접근
console.log(data.length);

// 배열 수정 및 추가
data[2] = 'MySQL';      // 수정
data.push('Spark');     // 추가
size.push(382);
console.log(data, size);

// 중첩 사용 (객체)
const programing = {
    language : 'Python',
    platform : ['Pycharm', 'Colab'],
    library : {
        frame : ['PyTorch', 'Tensorflow'],
        server : 'flask',
        analyze : 'SiPy'
    }
};
console.log(programing.platform[0]);
console.log(programing.library.server);

// 중첩 사용 (배열)
const data_size = [['Python', 25.5], ['R', 81.7], ['MySQL', 296.1], ['Spark', 382]];
const CoBa = [
    { dev : 'Python', ana : 'R', db : ['MySQL', 'Spark'] },
    { name : 'Coba', doc : 'Coding Barista'},
    [1, 2, 3, 4, 5]
]
console.log(data_size[3][0]);
console.log(CoBa[0].db);
console.log(CoBa[2][3]);