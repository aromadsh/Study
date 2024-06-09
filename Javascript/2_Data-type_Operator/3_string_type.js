// 기본 표현법
let word_case1 = '안녕하세요! 🙂';
console.log(word_case1);

let word_case2 = "반갑습니다~ 👋";
console.log(word_case2);

let word_case3 = '작은따옴표 안에 "큰따옴표" 사용';
let word_case4 = "큰따옴표 안에 '작은따옴표' 사용";
console.log(word_case3, word_case4);

// let word1 = '작은따옴표 안에 '작은따옴표' 사용';
// let word2 = "큰따옴표 안에 "큰따옴표" 사용";
// console.log(word1, word2); // 오류 발생

// 이스케이프 표현(escape sequence)
let word_single = '작은따옴표 안에 \'작은따옴표\' 사용';
let word_double = "큰따옴표 안에 \"큰따옴표\" 사용";
let word_newline = "\n안녕하세요.\n반갑습니다.\n"
let word_tab = "\t안녕하세요.\t반갑습니다.\t"
let word_backslash = "\n안녕하세요.\\반갑습니다."
console.log(word_single, word_double, word_newline, word_tab, word_backslash);

// 긴줄 표현
let longName = '김수한무 거북이와 두루미 \
삼천갑자 동방삭 치치카포 사리사리센타 \
워리워리 세브리깡 무두셀라 구름이 \
허리케인에 담벼락 담벼락에 서생원 \
서생원에 고양이 고양이엔 바둑이 \
바둑이는 돌돌이';

console.log(longName);

// 백틱
let word = `헬로헬로~ 🤩`;
console.log(word);

const NAME = '홍길동';
let age = 20;
let married = false;

console.log(
`제 이름은 ${NAME}, 나이는 ${age}세구요, \
${married ? '기혼' : '미혼'}입니다.`
);