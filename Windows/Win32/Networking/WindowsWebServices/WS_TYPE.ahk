#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The types supported for serialization.
 * @remarks
 * 
 * Many of the <b>WS_TYPE</b>s have a corresponding type description structure
 *                 which allows for additional information used to serialize or deserialize the
 *                 type.
 *             
 * 
 * For example, the <b>WS_INT32_TYPE</b> has a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_int32_description">WS_INT32_DESCRIPTION</a>structure which allows for constraints on the deserialized values.  This is an optional
 *                 type description (if not specified, the full 32-bit integer space is allowed).
 *             
 * 
 * Another example is the <b>WS_STRUCT_TYPE</b>, which allows for the specification of
 *                 a user-defined structure with fields.  The fields are described in a 
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a>.  This type description is required.
 *             
 * 
 * Type description pointers accompany <b>WS_TYPE</b> in the various APIs and structures 
 *                 that are based on serialization.  This should be <b>NULL</b> or non-<b>NULL</b> based on whether or not
 *                 the type description is not defined, optional or required.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TYPE extends Win32Enum{

    /**
     * Used when serializing a <b>BOOL</b> value.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_bool_description">WS_BOOL_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_BOOL_TYPE => 0

    /**
     * Used when serializing a signed 8-bit integer (<b>char</b>).
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_int8_description">WS_INT8_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_INT8_TYPE => 1

    /**
     * Used when serializing a signed 16-bit integer (<b>short</b>).
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_int16_description">WS_INT16_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_INT16_TYPE => 2

    /**
     * Used when serializing a signed 32-bit integer.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_int32_description">WS_INT32_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_INT32_TYPE => 3

    /**
     * Used when serializing a signed 64-bit integer.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_int64_description">WS_INT64_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_INT64_TYPE => 4

    /**
     * Used when serializing an unsigned 8-bit integer (<b>BYTE</b>).
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint8_description">WS_UINT8_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_UINT8_TYPE => 5

    /**
     * Used when serializing an unsigned 16-bit integer.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint16_description">WS_UINT16_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_UINT16_TYPE => 6

    /**
     * Used when serializing an unsigned 32-bit integer.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">WS_UINT32_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_UINT32_TYPE => 7

    /**
     * Used when serializing an unsigned 64-bit integer.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint64_description">WS_UINT64_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_UINT64_TYPE => 8

    /**
     * Used when serializing a <b>float</b>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_float_description">WS_FLOAT_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_FLOAT_TYPE => 9

    /**
     * Used when serializing a <b>double</b>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_double_description">WS_DOUBLE_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_DOUBLE_TYPE => 10

    /**
     * Used when serializing a <b>DECIMAL</b>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_decimal_description">WS_DECIMAL_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_DECIMAL_TYPE => 11

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime_description">WS_DATETIME_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_DATETIME_TYPE => 12

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_timespan">WS_TIMESPAN</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_timespan_description">WS_TIMESPAN_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_TIMESPAN_TYPE => 13

    /**
     * Used when serializing a <b>GUID</b>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_guid_description">WS_GUID_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_GUID_TYPE => 14

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_unique_id">WS_UNIQUE_ID</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_unique_id_description">WS_UNIQUE_ID_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_UNIQUE_ID_TYPE => 15

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string">WS_STRING</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string_description">WS_STRING_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_XML_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented by setting the chars field to <b>NULL</b> and specifying a length of 0.
     *                     A nil string is distinquished from an empty string based on whether or not the chars field 
     *                     is <b>NULL</b> or not when the length is zero.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_STRING_TYPE => 16

    /**
     * Used when serializing a zero-terminated <b>WCHAR</b>*.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_wsz_description">WS_WSZ_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * Deserialization will return an error if the wire form of the string 
     *                     contains an embedded zero.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_XML_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     *                     The default value should point to the address of a WCHAR*, and 
     *                     the size should be sizeof(WCHAR*).
     * @type {Integer (Int32)}
     */
    static WS_WSZ_TYPE => 17

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_bytes">WS_BYTES</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_bytes_description">WS_BYTES_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented by setting the bytes field to <b>NULL</b> and specifying a length of 0.  
     *                     A nil array is distinquished from an empty array based on whether or not the bytes field is 
     *                     <b>NULL</b> or not when the length is zero.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_BYTES_TYPE => 18

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string_description">WS_XML_STRING_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * Embedded zeros are allowed in the array of utf8 bytes.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented by setting the bytes field to <b>NULL</b> and specifying a length of 0.  
     *                     A nil string is distinquished from an empty string based on whether or not the bytes field is 
     *                     <b>NULL</b> or not when the length is zero.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_XML_STRING_TYPE => 19

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_qname">WS_XML_QNAME</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_qname_description">WS_XML_QNAME_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_POINTER</b>.
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_XML_QNAME_TYPE => 20

    /**
     * Used when serializing an <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>*.
     *                 
     * 
     * This type has no associated type description structure.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ANY_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_CONTENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     *                 
     * 
     * The interpretation of the contents of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> is as follows:
     *                 
     * 
     * <ul>
     * <li>
     * When used at the top level or with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>, the
     *                         <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> should contain a single element which represents
     *                         the attribute and element content.  The local name and namespace of the
     *                         element in the buffer is ignored; it is replaced with actual element
     *                         name and namespace when the buffer is written.  For example:
     *                     
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * // Element in WS_XML_BUFFER
     * &lt;PrefixInBuffer:LocalNameInBuffer xmlns:PrefixInBuffer="namespace-in-buffer" other-attributes&gt;
     * text-and-or-element-content
     * &lt;/PrefixInBuffer:LocalNameInBuffer&gt;
     * 
     * // Element that is written
     * &lt;NewPrefix:NewLocalName xmlns:NewPrefix="new-namespace" other-attributes&gt;
     * text-and-or-element-content
     * &lt;/NewPrefix:NewLocalName&gt;</code></pre>
     * To avoid problems with namespace collisions, it is a best practice to follow one of the
     *                         following rules when selecting a namespace for the element in the buffer:
     *                     
     * 
     * <ul>
     * <li>Use a namespace other than "" that is not otherwise used in the buffer.
     *                         </li>
     * <li>Use the same namespace as the element that will be written.
     *                     </li>
     * </ul>
     * When the value is deserialized, the element name and namespace will correspond
     *                         to the element that was read.
     *                     
     * 
     * </li>
     * <li>
     * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ELEMENT_FIELD_MAPPING</a>, the
     *                         <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> should contain a single element which 
     *                         represents a single element in the XML content.
     *                     
     * 
     * </li>
     * <li>
     * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>, each
     *                         of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>s that are serialized in the array
     *                         has the same convention as with <b>WS_ELEMENT_FIELD_MAPPING</b>described above (each WS_XML_BUFFER represents a single element
     *                         in the XML content).
     *                     
     * 
     * </li>
     * <li>
     * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING</a>, each
     *                         of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>s that are serialized in the array
     *                         represents a single element in the XML content.
     *                     
     * 
     * </li>
     * <li>
     * When used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_CONTENT_FIELD_MAPPING</a>, the
     *                         <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> may contain zero or more top level elements
     *                         or text.  This content corresponds to the remaining XML content of the 
     *                         containing structure.
     *                     
     * 
     * </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static WS_XML_BUFFER_TYPE => 21

    /**
     * Used when serializing two fields of a structure as a unit: a <b>WCHAR</b>* field which
     *                     points to an array of WCHARs, and a ULONG field which contains the number
     *                     of characters in the array.  This type may only be used within a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * struct
     * {
     *     ULONG count;    // array length, in characters
     *     WCHAR* chars;   // array of unicode characters
     * } value;</code></pre>
     * The fields can be anywhere in the contained structure and in any order, since
     *                     their offsets within the structure are specified separately as part of the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                     The offset of the count field is specified in the countOffset field, and the
     *                     offset of the chars field is specified in the offset field.
     *                 
     * 
     * Embedded zeros are allowed in the array of characters.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_char_array_description">WS_CHAR_ARRAY_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type may only be used within a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_XML_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE_ITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil string is represented by setting the chars field to <b>NULL</b> and specifying a length of 0.
     *                     A nil string is distinquished from an empty string based on whether or not the chars field is
     *                     <b>NULL</b> or not (in both cases the length is zero).
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_CHAR_ARRAY_TYPE => 22

    /**
     * Used when serializing two fields of a structure as a unit: a BYTE* field which
     *                     points to an array of UTF8 bytes, and a ULONG field which contains the number
     *                     of bytes in the array.  This type may only be used within a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * struct
     * {
     *     ULONG count; // array length, in bytes
     *     BYTE* bytes; // array of utf8 characters
     * } value;</code></pre>
     * The fields can be anywhere in the contained structure and in any order, since
     *                     their offsets within the structure are specified separately as part of the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                     The offset of the count field is specified in the countOffset field, and the
     *                     offset of the bytes field is specified in the offset field.
     *                 
     * 
     * Embedded zeros are allowed in the array of utf8 bytes.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_utf8_array_description">WS_UTF8_ARRAY_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type may only be used within a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * </ul>
     * A nil string is represented by setting the bytes field to <b>NULL</b> and specifying a length of 0.
     *                     A nil string is distinquished from an empty string based on whether or not the bytes field is
     *                     <b>NULL</b> or not (in both cases the length is zero).
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_UTF8_ARRAY_TYPE => 23

    /**
     * Used when serializing two fields of a structure as a unit: a BYTE* field which
     *                     points to an array bytes, and a ULONG field which contains the number
     *                     of bytes in the array.  This type may only be used within a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * struct
     * {
     *     ULONG count;    // array length, in bytes
     *     BYTE* bytes;    // array of bytes
     * } value;</code></pre>
     * The fields can be anywhere in the contained structure and in any order, since
     *                     their offsets within the structure are specified separately as part of the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                     The offset of the count field is specified in the countOffset field, and the 
     *                     offset of the bytes field is specified in the offset field.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_byte_array_description">WS_BYTE_ARRAY_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type may only be used within a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b></li>
     * </ul>
     * A nil array is represented by setting the array pointer field to <b>NULL</b> and specifying a length of 0.
     *                     A nil array is distinquished from an empty array based on whether or not the array pointer field is
     *                     <b>NULL</b> or not (in both cases the length is zero).
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_BYTE_ARRAY_TYPE => 24

    /**
     * Used to represent the XML type of the structure being serialized.  This can be used
     *                     to identify sub-types using the xsi:type attribute from XML Schema.  The field of
     *                     the structure must be of type <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION*</a>.
     *                 
     * 
     * This type does not have an associated type description.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type may only be used within a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TYPE_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                 </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static WS_DESCRIPTION_TYPE => 25

    /**
     * Used when serializing a user-defined structure.  The associated type description points to a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a> which provides information about how to serialize 
     *                     the fields of the structure.
     *                 
     * 
     * This type requires a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a> type description
     *                     to be supplied which provides information about how to serialize the type.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values,
     *                     as long as the fields defined by the structure follow the stated restrictions:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>.  All field mappings are supported.
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>.
     *                         Only the following mappings are supported:
     *                         <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>.
     *                     Only the following mappings are supported:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * <li></li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_STRUCT_TYPE => 26

    /**
     * Used when serializing a custom type.    The associated type description points to a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a> which provides information about how to serialize the type.
     *                 
     * 
     * This type requires a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a> type description
     *                     to be supplied which provides information about how to serialize the type, including
     *                     a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_type_callback">WS_READ_TYPE_CALLBACK</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_type_callback">WS_WRITE_TYPE_CALLBACK</a> which
     *                     are used to read and write the type.
     *                 
     * 
     * The callbacks are passed the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> and make the determination
     *                     as to whether the mapping is supported.
     *                 
     * 
     * The support for each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> value is dependent on the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> support determined by the callback.  The rules
     *                     are as follows:
     *                 
     * 
     * <ul>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a> is supported, then the following field mappings are supported:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a> is supported, then the following field mappings are supported:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a> is supported, then the following field mappings are supported:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ANY_ELEMENT_TYPE_MAPPING</a> is supported, then the following field mappings are supported:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * </li>
     * </ul>
     * Regardless of what <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values are supported, the type
     *                     can always be used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_CUSTOM_TYPE => 27

    /**
     * Used when serializing <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> .  The associated type description points to a
     *                     <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address_description">WS_ENDPOINT_ADDRESS_DESCRIPTION</a> which provides information about how to serialize the endpoint address.
     *                 
     * 
     * This type requires a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address_description">WS_ENDPOINT_ADDRESS_DESCRIPTION</a> type description
     *                     to be supplied which provides information about the serialization format.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_ENDPOINT_ADDRESS_TYPE => 28

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a>.  The associated type description points to a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault_description">WS_FAULT_DESCRIPTION</a> which provides information about how to serialize the fault.
     *                 
     * 
     * This type requires a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault_description">WS_FAULT_DESCRIPTION</a> type description
     *                     to be supplied which provides information about the serialization format.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_FAULT_TYPE => 29

    /**
     * This type is used to specify an arbitrary size field.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_void_description">WS_VOID_DESCRIPTION</a> can optionally be supplied in order
     *                     to specify the size of the type.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type can only be used within the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a> of a
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>.  This is used to initialize a field of a structure 
     *                     to a default value when deserializing.  This is used for the case where the 
     *                     particular field does not have a mapping to the XML content, and the type 
     *                     is not one of the other <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>s.  The value will be initialized as
     *                     follows:
     *                     <ul>
     * <li>If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> is specified, then the field will
     *                         be set to <b>NULL</b>.
     *                         </li>
     * <li>If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> is not specified, then the field will
     *                         be set to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> if allowed for the type and 
     *                         specified, otherwise it will be set to all zeros.  The size of the field is specified as part of
     *                         the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_void_description">WS_VOID_DESCRIPTION</a>.  If a <b>WS_VOID_DESCRIPTION</b>is not specified, the field is interpreted as being size 0.
     *                     </li>
     * </ul>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ELEMENT_FIELD_MAPPING</a>, <b>WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING</b>,
     *                     <b>WS_ELEMENT_FIELD_MAPPING</b>, <b>WS_ATTRIBUTE_FIELD_MAPPING</b>, 
     *                     <b>WS_ANY_CONTENT_FIELD_MAPPING</b> or
     *                     <b>WS_ANY_ATTRIBUTES_FIELD_MAPPING</b>.   This is 
     *                     used to discard the XML content when deserializing, or ignore the field when serializing.  
     *                     Since the values are not stored, a field of the structure is not required.  The field 
     *                     offset should be zero and the field size should be zero (which is the default if a 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_void_description">WS_VOID_DESCRIPTION</a> is not specified).  The <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> 
     *                     option should not be used.
     *                 </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static WS_VOID_TYPE => 30

    /**
     * Used when serializing a signed 32-bit integer which corresponds
     *                     to an enumerated value.
     *                 
     * 
     * This type requires a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_enum_description">WS_ENUM_DESCRIPTION</a> type description
     *                     to be supplied which provides information about the enumeration values 
     *                     and their corresponding serialized form.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_ENUM_TYPE => 31

    /**
     * Used when serializing a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a>.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration_description">WS_DURATION_DESCRIPTION</a> type description can optionally be
     *                     specified for this type in order to constrain the allowed values.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ATTRIBUTE_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ATTRIBUTE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_TEXT_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_NO_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_NILLABLE</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_POINTER</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_POINTER</a> | <b>WS_FIELD_NILLABLE</b> | <b>WS_FIELD_OPTIONAL</b> | <b>WS_FIELD_NILLABLE_ITEM</b></li>
     * </ul>
     * A nil value is represented using a <b>NULL</b> pointer.
     *                 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a> may be specified for this type.
     *                     See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> to see
     *                     which field mapping values allow a default value to be specified.
     * @type {Integer (Int32)}
     */
    static WS_DURATION_TYPE => 32

    /**
     * Used when serializing a set of choices which correspond to a tagged union.
     *                 
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * enum EnumType
     * {
     * // values identifying each choice
     * } value;
     * struct StructType
     * {
     * // value indicating which choice is set currently
     * EnumType selector;
     * union
     * {
     * // values corresponding to each choice
     * } value;
     * };</code></pre>
     * This type requires a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a> type description
     *                     to be supplied which provides information about the choices and
     *                     their corresponding serialized form.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_TYPE_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_ELEMENT_CONTENT_TYPE_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ELEMENT_CHOICE_FIELD_MAPPING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                     </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>
     * </li>
     * </ul>
     * This type does not support nil values.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     *                     When used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONAL</a>, the default value in the 
     *                     union is specified using the nonEnumValue of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_union_description">WS_UNION_DESCRIPTION</a>.
     * @type {Integer (Int32)}
     */
    static WS_UNION_TYPE => 33

    /**
     * Used when serializing a set of attributes that are not mapped to fields
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_any_attributes">WS_ANY_ATTRIBUTES</a>.
     *                 
     * 
     * This type does not have an associated type description.
     *                 
     * 
     * This type cannot be used with any <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> values.
     *                 
     * 
     * This type may only be used within a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_field_description">WS_FIELD_DESCRIPTION</a>.
     *                 
     * 
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> values:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ATTRIBUTES_FIELD_MAPPING</a>
     * </li>
     * </ul>
     * This type can be used with the following <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type">WS_FIELD_OPTIONS</a> values.  See the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_FIELD_MAPPING</a> for which options are supported for a given field mapping value:
     *                 
     * 
     * <ul>
     * <li>0
     *                 </li>
     * </ul>
     * This type does not support nil values.
     *                 
     * 
     * This type does not support specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_default_value">WS_DEFAULT_VALUE</a>.
     * @type {Integer (Int32)}
     */
    static WS_ANY_ATTRIBUTES_TYPE => 34
}
