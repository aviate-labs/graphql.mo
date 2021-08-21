import QL "../../src/QL";
import TS "../../src/TS";

/*schema {
  query: MyQueryRootType
  mutation: MyMutationRootType
}

type MyQueryRootType {
  someField: String
}

type MyMutationRootType {
  setSomeField(to: String): String
}*/
let schema : TS.SchemaDefinition = (
    null, [
        (#Query, "MyQueryRootType"),
        (#Mutation, "MyMutationRootType"),
    ],
);

let myQueryRootType : TS.TypeDefinition = #ObjectTypeDefinition(
    (
      null,
      "MyQueryRootType",
      null,
      null,
      ?[
        (null, "someField", null, #NamedType("String"), null)
      ],
    ),
);

let myMutationRootTyp: TS.TypeDefinition = #ObjectTypeDefinition(
    (
      null,
      "MyMutationRootType",
      null,
      null,
      ?[
        (null, "setSomeField", ?[
          (null, "to", #NamedType("String"), null, null),
        ], #NamedType("String"), null)
      ],
    ),
);
