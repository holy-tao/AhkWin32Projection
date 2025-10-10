#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents serialization information about a field within a structure.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_field_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FIELD_DESCRIPTION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Identifies how the field maps to the XML.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for 
     *                     the ways that the field can be exposed in the XML content.
     * @type {Integer}
     */
    mapping {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The XML local name to use for the field.
     *                 
     * 
     * This field is required, except in the following case, where it may be <b>NULL</b>.
     *                     If the mapping field is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>, then
     *                     this identifies the local name of the "wrapper" element that is the parent element
     *                     of the array item elements.  Setting this field (and the ns field) to <b>NULL</b>will omit the wrapper element.  The ns and localName fields must be either both
     *                     specified or both <b>NULL</b>.
     * @type {Pointer<WS_XML_STRING>}
     */
    localName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The XML namespace to use for the field.
     *                 
     * 
     * This field is required, except in the following case, where it may be <b>NULL</b>.
     *                     If the mapping field is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>, then
     *                     this identifies the namespace of the "wrapper" element that is the parent element
     *                     of the array item elements.  Setting this field (and the localName field) to <b>NULL</b>will omit the wrapper element.  The ns and localName fields must be either both
     *                     specified or both <b>NULL</b>.
     * @type {Pointer<WS_XML_STRING>}
     */
    ns {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The type of the field.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a> for a list of supported types.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @type {Pointer<Void>}
     */
    typeDescription {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The offset of the field within the containing structure.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Additional flags for the field.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> for 
     *                     a list of flags.  If no flags are needed, this may be 0.
     * @type {Integer}
     */
    options {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

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
     * @type {Pointer<WS_DEFAULT_VALUE>}
     */
    defaultValue {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The structure offset of the ULONG field that represents the number of items in the array.
     *                 
     * 
     * This field is used when using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a> or array types 
     *                     (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_CHAR_ARRAY_TYPE</a>, <b>WS_UTF8_ARRAY_TYPE</b>, <b>WS_BYTE_ARRAY_TYPE</b>).  
     *                     In other cases, it does not need to be specified (it can be 0).
     * @type {Integer}
     */
    countOffset {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The XML local name to use for the repeating elements when
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>.
     *                 
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     * @type {Pointer<WS_XML_STRING>}
     */
    itemLocalName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The XML namespace to use for the repeating elements when
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>.
     *                 
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     * @type {Pointer<WS_XML_STRING>}
     */
    itemNs {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The minimum and maximum number of repeating elements
     *                     that may appear when using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>,
     *                     <b>WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING</b>,
     *                     or <b>WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING</b>.
     *                 If not specified (<b>NULL</b>), the minimum is 0, and the maximum is MAX ULONG.
     *             
     * 
     * In other cases this field does not need to be specified (it can be <b>NULL</b>).
     * @type {Pointer<WS_ITEM_RANGE>}
     */
    itemRange {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
