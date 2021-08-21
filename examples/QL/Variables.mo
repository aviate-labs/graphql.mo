import QL "../../src/QL";

/*query getProfile($devicePicSize: Int) {
  user(id: 4) {
    id
    name
    profilePic(size: $devicePicSize)
  }
}*/

let operation : QL.ExecutableDefinition = #OperationDefinition(
    #OperationType((#Query, ?"getProfile", ?[
        ("devicePicSize", (#NamedType("Int"), null))
    ], 
    null, 
    [
        #Field(QL.newField("int")),
        #Field(QL.newField("int")),
        #InlineFragment((
            ?"User", null, [
                #Field(QL.newFieldSub(
                    "friends", [
                        #Field(QL.newField("count")),
                    ],
                )),
            ],
        )),
        #InlineFragment((
            ?"Page", null, [
                #Field(QL.newFieldSub(
                    "likers", [
                        #Field(QL.newField("count")),
                    ],
                )),
            ],
        )),
    ])),
);
