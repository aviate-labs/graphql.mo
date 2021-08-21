import QL "QL";

/// The GraphQL Type system describes the capabilities of a GraphQL server and
/// is used to determine if a query is valid. The type system also describes the
/// input types of query variables to determine if values provided at runtime
/// are valid.
module TypeSystem {
    // 3: Type System
    public type TypeSystemDefinition = {
        #SchemaDefinition : SchemaDefinition;
        #TypeDefinition : TypeDefinition;
        #DirectiveDefinition : DirectiveDefinition;
    };

    // 3.1: Type System Extensions
    public type TypeSystemExtension = {
        #SchemaExtension : SchemaExtension;
        #TypeExtension : TypeExtension;
    };

    // 3.2: Schema
    public type SchemaDefinition = (?QL.Directives, [OperationTypeDefinition]);
    public type OperationTypeDefinition = (QL.OperationType, QL.NamedType);

    // 3.2.2: Schema Extension
    public type SchemaExtension = {
        #TypeDefinitions : (?QL.Directives, [OperationTypeDefinition]);
        #Directives : QL.Directives;
    };

    // 3.3: Descriptions
    public type Description = QL.Primitives.StringValue;

    // 3.4: Types
    public type TypeDefinition = {
        #ScalarTypeDefinition : ScalarTypeDefinition;
        #ObjectTypeDefinition : ObjectTypeDefinition;
        #InterfaceTypeDefinition : InterfaceTypeDefinition;
        #UnionTypeDefinition : UnionTypeDefinition;
        #EnumTypeDefinition : EnumTypeDefinition;
        #InputObjectTypeDefinition : InputObjectTypeDefinition;
    };
    // 3.4.3: Type Extensions
    public type TypeExtension = {
        #ScalarTypeExtension;
        #ObjectTypeExtension;
        #InterfaceTypeExtension;
        #UnionTypeExtension;
        #EnumTypeExtension;
        #InputObjectTypeExtension;
    };

    // 3.5 Scalars
    public type ScalarTypeDefinition = (?Description, QL.Name, ?QL.Directives);
    module ScalarType {
        // The Int scalar type represents a signed 32‐bit numeric non‐fractional value.
        let Int : TypeSystem.ScalarTypeDefinition = (null, "Int", null);
        // The Float scalar type represents signed double‐precision fractional values as specified by IEEE 754.
        let Float : TypeSystem.ScalarTypeDefinition = (null, "Float", null);
        // The String scalar type represents textual data, represented as UTF‐8 character sequences.
        let String : TypeSystem.ScalarTypeDefinition = (null, "String", null);
        // The Boolean scalar type represents true or false.
        let Boolean : TypeSystem.ScalarTypeDefinition = (null, "Boolean", null);
        // The ID scalar type represents a unique identifier, often used to refetch an object or as the key for a cache. 
        let ID : TypeSystem.ScalarTypeDefinition = (null, "ID", null);
    };
    public type ScalarTypeExtension = (QL.Name, QL.Directives);

    // 3.6:s Objects
    public type ObjectTypeDefinition = (?Description, QL.Name, ?ImplementsInterfaces, ?QL.Directives, ?FieldsDefinition);
    public type ImplementsInterfaces = {
        #Implements : QL.NamedType;
        #ImplementsInterfaces : (ImplementsInterfaces, QL.NamedType);
    };
    public type FieldsDefinition = [FieldDefinition];
    public type FieldDefinition = (?Description, QL.Name, ?ArgumentsDefinition, QL.Type, ?QL.Directives);

    // 3.6.1: Field Arguments
    public type ArgumentsDefinition = [InputValueDefinition];
    public type InputValueDefinition = (?Description, QL.Name, QL.Type, ?QL.DefaultValue, ?QL.Directives);

    // 3.6.3: Object Extensions
    public type ObjectTypeExtension = {
        #FieldsDefinition : (QL.Name, ?ImplementsInterfaces, ?QL.Directives, FieldsDefinition);
        #Directives : (QL.Name, ?ImplementsInterfaces, QL.Directives);
        #ImplementsInterfaces : (QL.Name, ImplementsInterfaces);
    };

    // 3.7: Interfaces
    public type InterfaceTypeDefinition = (?Description, QL.Name, ?QL.Directives, ?FieldsDefinition);

    // 3.7.1: Interface Extensions
    public type InterfaceTypeExtension = {
        #FieldsDefinition : (QL.Name, ?QL.Directives, FieldsDefinition);
        #Directives : (QL.Name, QL.Directives);
    };

    // 3.8: Unions
    public type UnionTypeDefinition = (?Description, QL.Name, ?QL.Directives, ?UnionMemberTypes);
    public type UnionMemberTypes = {
        #NamedType : QL.NamedType;
        #UnionMemberTypes : (UnionMemberTypes, QL.NamedType);
    };

    // 3.8.1: Union Extensions
    public type UnionTypeExtension = {
        #UnionMemberTypes : (QL.Name, ?QL.Directives, UnionMemberTypes);
        #Directives : (QL.Name, QL.Directives);
    };

    // 3.9: Enums
    public type EnumTypeDefinition = (?Description, QL.Name, ?QL.Directives, ?EnumValuesDefinition);
    public type EnumValuesDefinition = [EnumValueDefinition];
    public type EnumValueDefinition = (?Description, QL.Primitives.EnumValue, ?QL.Directives);

    // 3.9.1: Enum Extensions
    public type EnumTypeExtension = {
        #EnumTypeExtension : (QL.Name, ?QL.Directives, EnumTypeExtension);
        #Directives : (QL.Name, QL.Directives);
    };

    // 3.10: Input Objects
    public type InputObjectTypeDefinition = (?Description, QL.Name, ?QL.Directives, ?InputFieldsDefinition);
    public type InputFieldsDefinition = [InputValueDefinition];

    // 3.10.1: Input Object Extensions
    public type InputObjectTypeExtension = {
        #InputObjectTypeExtension : (QL.Name, ?QL.Directives, InputObjectTypeExtension);
        #Directives : (QL.Name, QL.Directives);
    };

    // 3.13: Directives
    public type DirectiveDefinition = (?Description, QL.Name, ?ArgumentsDefinition, DirectiveLocations);
    public type DirectiveLocations = {
        #DirectiveLocation : DirectiveLocation;
        #DirectiveLocations : (DirectiveLocations, DirectiveLocation)
    };
    public type DirectiveLocation= {
        #ExecutableDirectiveLocation : ExecutableDirectiveLocation;
        #TypeSystemDirectiveLocation : TypeSystemDirectiveLocation;
    };

    public type ExecutableDirectiveLocation = {
        #QUERY;
        #MUTATION;
        #SUBSCRIPTION;
        #FIELD;
        #FRAGMENT_DEFINITION;
        #FRAGMENT_SPREAD;
        #INLINE_FRAGMENT;
    };

    public type TypeSystemDirectiveLocation = {
        #SCHEMA;
        #SCALAR;
        #OBJECT;
        #FIELD_DEFINITION;
        #ARGUMENT_DEFINITION;
        #INTERFACE;
        #UNION;
        #ENUM;
        #ENUM_VALUE;
        #INPUT_OBJECT;
        #INPUT_FIELD_DEFINITION;
    };
};