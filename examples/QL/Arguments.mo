import QL "../../src/QL";

/*{
  user(id: 4) {
    id
    name
    profilePic(size: 100)
  }
}*/
let userArgs1 = QL.newFieldArgsSub(
    "user", [("id", #IntValue(4))], [
        #Field(QL.newField("id")),
        #Field(QL.newField("name")),
        #Field(QL.newFieldArgs(
            "profilePic", [("size", #IntValue(100))],
        )),
    ],
);

/*{
  user(id: 4) {
    id
    name
    profilePic(width: 100, height: 50)
  }
}*/
let userArgs2 = QL.newFieldArgsSub(
    "user", [("id", #IntValue(4))], [
        #Field(QL.newField("id")),
        #Field(QL.newField("name")),
        #Field(QL.newFieldArgs(
            "profilePic", [
                ("width", #IntValue(100)),
                ("height", #IntValue(50)),
            ],
        )),
    ],
);
