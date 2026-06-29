#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_ITEM_RANGE.ahk" { WS_ITEM_RANGE }
#Import ".\WS_FIELD_MAPPING.ahk" { WS_FIELD_MAPPING }
#Import ".\WS_TYPE.ahk" { WS_TYPE }
#Import ".\WS_DEFAULT_VALUE.ahk" { WS_DEFAULT_VALUE }

/**
 * Represents serialization information about a field within a structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_field_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FIELD_DESCRIPTION {
    #StructPack 8

    /**
     * Identifies how the field maps to the XML.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for 
     *                     the ways that the field can be exposed in the XML content.
     */
    mapping : WS_FIELD_MAPPING

    /**
     * The XML local name to use for the field.
     *                 
     * 
     * This field is required, except in the following case, where it may be <b>NULL</b>.
     *                     If the mapping field is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>, then
     *                     this identifies the local name of the "wrapper" element that is the parent element
     *                     of the array item elements.  Setting this field (and the ns field) to <b>NULL</b> will omit the wrapper element.  The ns and localName fields must be either both
     *                     specified or both <b>NULL</b>.
     */
    localName : WS_XML_STRING.Ptr

    /**
     * The XML namespace to use for the field.
     *                 
     * 
     * This field is required, except in the following case, where it may be <b>NULL</b>.
     *                     If the mapping field is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>, then
     *                     this identifies the namespace of the "wrapper" element that is the parent element
     *                     of the array item elements.  Setting this field (and the localName field) to <b>NULL</b> will omit the wrapper element.  The ns and localName fields must be either both
     *                     specified or both <b>NULL</b>.
     */
    ns : WS_XML_STRING.Ptr

    /**
     * The type of the field.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a> for a list of supported types.
     */
    type : WS_TYPE

    /**
     * Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     */
    typeDescription : IntPtr

    /**
     * The offset of the field within the containing structure.
     */
    offset : UInt32

    /**
     * Additional flags for the field.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> for 
     *                     a list of flags.  If no flags are needed, this may be 0.
     */
    options : UInt32

    /**
     * Points to a default value for the field.  This is used in the following instances:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> was specified, and the XML did not contain
     *                     the value.
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a> was specified.
     *                 </li>
     * </ul>
     * If defaultValue is <b>NULL</b>, then it is the same as having a default value
     *                     of all zero's.
     */
    defaultValue : WS_DEFAULT_VALUE.Ptr

    /**
     * The structure offset of the ULONG field that represents the number of items in the array.
     *                 
     * 
     * This field is used when using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a> or array types 
     *                     (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_CHAR_ARRAY_TYPE</a>, <b>WS_UTF8_ARRAY_TYPE</b>, <b>WS_BYTE_ARRAY_TYPE</b>).  
     *                     In other cases, it does not need to be specified (it can be 0).
     */
    countOffset : UInt32

    /**
     * The XML local name to use for the repeating elements when
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>.
     *                 
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     */
    itemLocalName : WS_XML_STRING.Ptr

    /**
     * The XML namespace to use for the repeating elements when
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>.
     *                 
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     */
    itemNs : WS_XML_STRING.Ptr

    /**
     * The minimum and maximum number of repeating elements
     *                     that may appear when using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>,
     *                     <b>WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING</b>,
     *                     or <b>WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING</b>.
     *                 If not specified (<b>NULL</b>), the minimum is 0, and the maximum is MAX ULONG.
     *             
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     */
    itemRange : WS_ITEM_RANGE.Ptr

}
