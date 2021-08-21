import QL "../../src/QL";

/*{
  id
  firstName
  lastName
}*/
let selectionSet : QL.SelectionSet = [
    #Field(QL.newField("id")),
    #Field(QL.newField("firstName")),
    #Field(QL.newField("lastName")),
];