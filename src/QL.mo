module QL {
    // 2.1.9: Names
    /// Names in GraphQL are case‐sensitive: /[_A-Za-z][_0-9A-Za-z]*/.
    public type Name = Text;

    // 2.2
    /// Describes a complete file or request string.
    public type Document = [Definition];
    public type Definition = {
        #ExecutableDefinition : ExecutableDefinition;
        #TypeSystemDefinition;
        #TypeSystemExtension;
    };
    public type ExecutableDefinition = {
        #OperationDefinition : OperationDefinition;
        #FragmentDefinition;
    };

    // 2.3
    public type OperationDefinition = {
        #OperationType : (OperationType, ?Name, ?VariableDefinitions, ?Directives, SelectionSet);
        #SelectionSet : SelectionSet;
    };
    public func newOperation(operationType : OperationType, selectionSet : SelectionSet) : OperationDefinition {
        #OperationType((operationType, null, null, null, selectionSet));
    };
    public type OperationType = {
        /// A read‐only fetch.
        #Query;
        /// A write followed by a fetch.
        #Mutation;
        /// A long‐lived request that fetches data in response to source events.
        #Subscription;
    };

    // 2.4
    public type SelectionSet = [Selection];
    public type Selection = {
        #Field : Field;
        #FragmentSpread : FragmentSpread;
        #InlineFragment : InlineFragment;
    };

    // 2.5
    public type Field = (?Alias, Name, ?Arguments, ?Directives, ?SelectionSet);
    public func newField(name : Name) : Field {
        (null, name, null, null, null);
    };
    public func newFieldArgs(name : Name, args : Arguments) : Field {
        (null, name, ?args, null, null);
    };
    public func newFieldSub(name : Name, selectionSet : SelectionSet) : Field {
        (null, name, null, null, ?selectionSet);
    };
    public func newFieldArgsSub(name : Name, args : Arguments, selectionSet : SelectionSet) : Field {
        (null, name, ?args, null, ?selectionSet);
    };


    // 2.6
    public type Arguments = [Argument];
    public type Argument = (Name, Value);

    // 2.7
    public type Alias = Name;

    // 2.8
    public type FragmentSpread = (FragmentName, ?Directives);
    public type FragmentDefinition = (FragmentName, TypeCondition, ?Directives, SelectionSet);
    public type FragmentName = Name;

    // 2.8.1
    public type TypeCondition = NamedType;

    // 2.8.2
    public type InlineFragment = (?TypeCondition, ?Directives, SelectionSet);

    // 2.9
    public type Value = {
        #Variable : Variable;
        #IntValue : Int;
        #FloatValue : Float;
        #StringValue : Text;
        #BooleanValue : Bool;
        #NullValue;
        #EnumValue : Name;
        #ListValue : [Value];
        #ObjectValue : [(Name, Value)];
    };

    // 2.10
    public type Variable = Name;
    public type VariableDefinitions = [VariableDefinition];
    public type VariableDefinition = (Variable, (Type, ?DefaultValue));
    public type DefaultValue = Value;

    // 2.11
    public type Type  = {
        #NamedType : NamedType;
        #ListType : ListType;
        #NonNullType: NonNullType; 
    };
    public type NamedType = Name;
    public type ListType = [Type];
    public type NonNullType = {
        #NamedType : Name;
        #ListType : [Type];
    };

    // 2.12
    public type Directives = [Directive];
    public type Directive = (Name, ?Arguments);
}