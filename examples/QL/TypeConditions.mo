import QL "../../src/QL";

/*query FragmentTyping {
  profiles(handles: ["quint", "di-wu"]) {
    handle
    ...userFragment
  }
}

fragment userFragment on User {
  friends {
    count
  }
}*/

let operation : QL.ExecutableDefinition = #OperationDefinition(
    #OperationType((#Query, ?"FragmentTyping", null, null, [
        #Field(QL.newFieldArgsSub(
            "profiles", 
            [
                (
                    "handles", 
                    #ListValue([
                        #StringValue("quint"), 
                        #StringValue("di-wu"),
                    ]),
                ),
            ],
            [
                #Field(QL.newField("handle")),
                #FragmentSpread(("userFragment", null))
            ],
        )),
    ])),
);

let fragmentUserFragment : QL.FragmentDefinition = (
    "userFragment",
    "User",
    null,
    [#Field(QL.newField("count"))],
);
