pragma solidity 0.4.24;

contract Registrar {
    //-S T U D E N T S-\\
    //Student Model
    struct Student {
        uint sid;
        string name;
    }
    //Student counter
    uint public studentCounter;
    //Map Students
    mapping(uint => Student) public students;
    //Add a Student
    function addStudent(string _name) private {
        studentCounter ++;
        students[studentCounter] = Student(studentCounter, _name);
    }
    //---------------------------

    //-C O U R S E S-\\
    //Course Model
    struct Course {
        uint cid;
        string title;
        uint credits;
    }
    //Course counter
    uint public courseCounter;
    //Map Courses
    mapping(uint => Course) public courses;
    //Add a Course
    function addCourse(string _title, uint _credits){
        courseCounter++;
        courses[courseCounter] = Course(courseCounter, _title, _credits);
    }
    //----------------------------

    //-G R A D E S-\\
    //Grades Model
    struct Grade {
        uint sid;
        uint cid;
        uint gpa;
    }
    //Map Students to their grades
    mapping(uint => Grade[]) public grades;
    //Add a Grade
    function addGrade(uint _sid, uint _cid, uint _gpa){
        Grade[] existingGrades = grades[_sid];
        existingGrades[existingGrades.length] = Grade(_sid, _cid, _gpa);
        grades[_sid] = existingGrades;
    }
    //------------------------------

    //-C O N T R A C T-\\
    function Registrar() public {
        addStudent("Mike");
        addStudent("Bairon");
        addCourse("Coding 101", 3);
        addGrade(1,1,350);
        addGrade(2,1,400);
    }
}