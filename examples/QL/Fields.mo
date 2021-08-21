import QL "../../src/QL";

/*{
  me {
    id
    firstName
    lastName
    birthday {
      month
      day
    }
    friends {
      name
    }
  }
}*/
let meField = QL.newFieldSub(
    "me", [
        #Field(QL.newField("id")),
        #Field(QL.newField("firstName")),
        #Field(QL.newField("lastName")),
        #Field(QL.newFieldSub("birthday", [
            #Field(QL.newField("month")),
            #Field(QL.newField("day")),
        ])),
        #Field(QL.newFieldSub("friends", [
            #Field(QL.newField("name")),
        ])),
    ],
);

/*{
  me {
    name
  }
}*/
let meFieldSimple = QL.newFieldSub(
    "me", [
        #Field(QL.newField("id")),
    ],
);

/*{
  user(id: 4) {
    name
  }
}*/
let userField = QL.newFieldArgsSub(
    "user", [("id", #IntValue(4))], [
        #Field(QL.newField("id")),
    ],
);
