import QL "../../src/QL";

/*mutation {
  likeStory(storyID: 12345) {
    story {
      likeCount
    }
  }
}*/

let operation : QL.OperationDefinition = QL.newOperation(
    #Query, [
        #Field(QL.newFieldArgsSub(
            "likeStory", [("storyID", #IntValue(12345))], [
                #Field(QL.newFieldSub(
                    "story", [
                        #Field(QL.newField("likeCount")),
                    ],
                )),
            ],
        )),
    ],
);
