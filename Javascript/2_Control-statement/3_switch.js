// switch

const num = 1;

switch (num) {
    case 1:
        console.log("one");
        break;
    case 2:
        console.log("two");
        break;
    case 3:
        console.log("three");
        break;
    default:
        console.log("ect number...");
}

const dt = 32;
let result;

switch (typeof dt){
    case 'string':
        result = typeof dt;
        break;
    case "int":
        result = typeof dt;
        break;
    case "float":
        result = typeof dt;
        break;
    case "boolean":
        result = typeof dt;
        break;
    default:
        result = typeof dt;
}
console.log(result);

let data_type = typeof "hello world";

const type_classifier = {
    string : "string",
    int : "int",
    float : "float",
    boolean : "boolean"
} [data_type] ?? typeof data_type

console.log(type_classifier);

const month = 1;
let season = '';

switch (month) {
  case 1: case 2: case 3:
    season = '1분기'; break;

  case 4: case 5: case 6:
    season = '2분기'; break;

  case 7: case 8: case 9:
    season = '3분기'; break;

  case 10: case 11: case 12:
    season = '4분기'; break;

  default: 
    season = '잘못된 월입니다.';
}

console.log(season);