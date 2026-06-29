#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_FIELD_DESCRIPTION.ahk" { WS_FIELD_DESCRIPTION }

/**
 * Information about C struct type, and how it maps to an XML element. This is used with WS_STRUCT_TYPE.
 * @remarks
 * The following is the grammar describing the order of the fields
 *                 within a structure.  The order is defined based on the
 *                 mapping field of each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
 *             
 * 
 * 
 * ``` syntax
 * 
 * Fields := TypeAttributeField? AttributeField* ContentFields UnmappedFields*
 * ContentFields := TextContentField | ElementContentFields
 * ElementContentFields := ElementContentField* ? AnyElementField?
 * ElementContentField := ElementField | RepeatingElementField | ElementChoiceField | RepeatingElementChoiceField
 * ElementField := WS_ELEMENT_FIELD_MAPPING
 * RepeatingElementField := WS_REPEATING_ELEMENT_FIELD_MAPPING
 * ElementChoiceField := WS_ELEMENT_CHOICE_FIELD_MAPPING
 * RepeatingElementChoiceField := WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING
 * AnyElementField := WS_ANY_ELEMENT_FIELD_MAPPING
 * TextContentField := WS_TEXT_FIELD_MAPPING
 * UnmappedField := WS_NO_FIELD_MAPPING
 * TypeAttributeField := WS_TYPE_ATTRIBUTE_FIELD_MAPPING
 * AttributeField := WS_ATTRIBUTE_FIELD_MAPPING
 * ```
 * 
 * Note that the fields descriptions of a structure are serialized and deserialized in
 *                 the order specified.  The deserialization process is "greedy", that is, as much content
 *                 as will match the definition a specific field description will be consumed before
 *                 the next field description will be considered.  This approach resolves any ambiguity
 *                 when content could match the current field description or a following one.
 *             
 * 
 * The deserialization process is also restrictive. All the content must be deserialized according
 *                 to the field descriptions. By default any unhandled elements and attributes will cause the deserialization
 *                 process to fail. However, trailing contents of the element are ignored and discarded when
 *                 <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_input_type">WS_STRUCT_IGNORE_TRAILING_ELEMENT_CONTENT</a> flag is set. Similarly, unhandled attributes are
 *                 ignored and discarded when <b>WS_STRUCT_IGNORE_UNHANDLED_ATTRIBUTES</b> flag is set.
 *             
 * 
 * Note that since the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> structures determine the location
 *                 of the actual field within the structure using an offset, there is no restriction
 *                 as to the actual order of the fields within the structure.
 *             
 * 
 * When one structure derives from (extends) another, the fields for both structures
 *                 must be included in the derived struct description, and the above grammar must be
 *                 maintained.  For example:
 *             
 * 
 * 
 * ``` syntax
 * struct BaseStructure
 * {
 *     const WS_STRUCT_DESCRIPTION* _type;
 *     int baseAttribute;
 *     int baseElement;
 * };
 * 
 * // BaseStructure field descriptions:
 * //    WS_TYPE_ATTRIBUTE_FIELD_MAPPING       // _type
 * //    WS_ATTRIBUTE_FIELD_MAPPING            // baseAttribute
 * //    WS_ELEMENT_FIELD_MAPPING              // baseElement
 * 
 * struct DerivedStructure
 * {
 *     struct BaseStructure _base;
 *     int derivedAttribute;
 *     int derivedElement;
 * };
 * 
 * // DerivedStructure field descriptions:
 * //    WS_TYPE_ATTRIBUTE_FIELD_MAPPING       // _type
 * //    WS_ATTRIBUTE_FIELD_MAPPING            // baseAttribute
 * //    WS_ATTRIBUTE_FIELD_MAPPING            // derivedAttribute
 * //    WS_ELEMENT_FIELD_MAPPING              // baseElement
 * //    WS_ELEMENT_FIELD_MAPPING              // derivedElement
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_struct_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_STRUCT_DESCRIPTION {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    size : UInt32

    /**
     * The alignment requirement of the structure.  This must be a power
     *                     of two between 1 and 8.
     */
    alignment : UInt32

    /**
     * An array of pointers to the descriptions of the fields of the structure.
     *                 
     * 
     * See the Remarks section for information about ordering of the fields
     *                     in this array.
     */
    fields : IntPtr

    /**
     * The number of fields in the fields array.  Any part of the structure
     *                     that is not represented by a field will be left uninitialized.
     *                     No two fields descriptions may reference the same offset of the structure.
     */
    fieldCount : UInt32

    /**
     * The XML type name of the structure.  This is only used when 
     *                     structures derive from other structures, and may be <b>NULL</b> otherwise.
     */
    typeLocalName : WS_XML_STRING.Ptr

    /**
     * The XML type namespace of the structure.  This is only used when 
     *                     structures derive from other structures, and may be <b>NULL</b> otherwise.
     */
    typeNs : WS_XML_STRING.Ptr

    /**
     * The type this type is derived from.  This is only used when 
     *                     structures derive from other structures, and may be <b>NULL</b> otherwise.
     */
    parentType : WS_STRUCT_DESCRIPTION.Ptr

    /**
     * An array of pointers to derived types.  This is only used when 
     *                     structures derive from other structures, and may be <b>NULL</b> otherwise.
     */
    subTypes : IntPtr

    /**
     * The number of types in the subTypes array.  This is only used when 
     *                     structures derive from other structures, and may be <b>NULL</b> otherwise.
     */
    subTypeCount : UInt32

    structOptions : UInt32

}
