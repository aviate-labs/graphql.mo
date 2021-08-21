import QL "../../src/QL";

/*{
  user(id: 4) {
    id
    name
    smallPic: profilePic(size: 64)
    bigPic: profilePic(size: 1024)
  }
}*/
let user4 = QL.newFieldArgsSub(
    "user", [("id", #IntValue(4))], [
        #Field(QL.newField("id")),
        #Field(QL.newField("name")),
        #Field((?"smallPic", "profilePic", ?[("size", #IntValue(64))], null, null)),
        #Field((?"bigPic", "profilePic", ?[("size", #IntValue(1024))], null, null)),
    ],
);

/*{
  quint: user(id: 4) {
    id
    name
  }
}*/
let quint : QL.Field = (
    ?"quint",
    "user",
    ?[("id", #IntValue(4))],
    null,
    ?[
        #Field(QL.newField("id")),
        #Field(QL.newField("name")),
    ],
);
