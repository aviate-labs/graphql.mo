import QL "../../src/QL";

/*query inlineFragmentTyping {
  profiles(handles: ["quint", "di-wu"]) {
    handle
    ... on User {
      friends {
        count
      }
    }
    ... on Page {
      likers {
        count
      }
    }
  }
}*/


let operation : QL.ExecutableDefinition = #OperationDefinition(
    #OperationType((#Query, ?"inlineFragmentTyping", null, null, [
        #Field(QL.newField("handle")),
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
