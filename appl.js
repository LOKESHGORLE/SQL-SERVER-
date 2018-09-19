function BodyBackroundChange() {
    $("body").css("background", "red");
}
function AddQualificationColumn() {
    var form = document.getElementById('AddQualification');
    var addform = document.createElement("input")
    console.log('start');
    form.appendChild(addform)
    console.log('created');
}
//function createQualField() {
//    var input = document.createElement('input');
//    input.type = 'text';
//    input.name = 'pet[]';
//    return input;
//}


//document.getElementById('Qualification').addEventListener('click', function (e) {
//    form.appendChild(createQualField())
//    ;
//});

//document.getElementById("AddQualification").onclick = function () {
//    var form = document.getElementById('AddQualification');
//    var addform = document.createElement("input")
//    form.appendChild(addform)
//}
