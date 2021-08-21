import QL "../../src/QL";

/*query withNestedFragments {
  user(id: 4) {
    friends(first: 10) {
      ...friendFields
    }
    mutualFriends(first: 10) {
      ...friendFields
    }
  }
}

fragment friendFields on User {
  id
  name
  ...standardProfilePic
}

fragment standardProfilePic on User {
  profilePic(size: 50)
}*/

let operation : QL.ExecutableDefinition = #OperationDefinition(
    #OperationType((#Query, ?"withNestedFragments", null, null, [
        #Field(QL.newFieldArgsSub(
            "user", [("id", #IntValue(4))], [
                #Field(QL.newFieldArgsSub(
                    "friends", [("first", #IntValue(10))], [
                        #FragmentSpread(("friendFields", null))
                    ],
                )),
                #Field(QL.newFieldArgsSub(
                    "mutualFriends", [("first", #IntValue(10))], [
                        #FragmentSpread(("friendFields", null))
                    ],
                )),
            ],
        )),
    ])),
);

let fragmentFriendFields : QL.FragmentDefinition = (
    "friendFields",
    "User",
    null,
    [
        #Field(QL.newField("id")),
        #Field(QL.newField("name")),
        #FragmentSpread((
            "standardProfilePic",
            null,
        )),
    ],
);

let fragmentStandardProfilePic : QL.FragmentDefinition = (
    "friendFields",
    "User",
    null,
    [
        #Field(QL.newFieldArgs(
            "profilePic",
            [("size", #IntValue(50))],
        )),
    ],
);
