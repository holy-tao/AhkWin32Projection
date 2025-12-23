#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * How a WS_TYPE maps to or from XML when serialized or deserialized.
 * @remarks
 * See the documentation for each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a> 
 *                 for which <b>WS_TYPE_MAPPING</b> values are supported.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_type_mapping
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TYPE_MAPPING extends Win32Enum{

    /**
     * This is used when reading or writing an element where the type
     *                     corresponds to the type of the element.
     *                     The definition of the type may include mappings to attributes,
     *                     text, or child elements of the element.
     *                 
     * 
     * The following calling sequence is used when writing an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsWriteStartElement(...)
     * WsWriteType(..., WS_ELEMENT_TYPE_MAPPING, ...)
     * WsWriteEndElement(...)
     * ```
     * 
     * The following calling sequence is used when reading an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsReadToStartElement(...)?
     * WsReadType(..., WS_ELEMENT_TYPE_MAPPING, ...)
     * ```
     * @type {Integer (Int32)}
     */
    static WS_ELEMENT_TYPE_MAPPING => 1

    /**
     * This is used when reading or writing the value of a single attribute.  The definition
     *                     of the type must not require any mappings to attributes or child elements.
     *                 
     * 
     * The following calling sequence is used when writing an attribute value.
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsWriteStartAttribute(...)
     * WsWriteType(..., WS_ATTRIBUTE_TYPE_MAPPING, ...)
     * WsWriteEndAttribute(...)
     * ```
     * 
     * The following calling sequence is used when reading an attribute value.
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsFindAttribute(...)
     * WsReadStartAttribute(...)
     * WsReadType(..., WS_ATTRIBUTE_TYPE_MAPPING, ...)
     * WsReadEndAttribute(...)
     * ```
     * @type {Integer (Int32)}
     */
    static WS_ATTRIBUTE_TYPE_MAPPING => 2

    /**
     * This is used when when the type corresponds to all or part of the 
     *                     content (text and child elements) of an element.
     *                     The definition of the type may include mappings to text or child
     *                     elements, but must not include any attributes.
     *                 
     * 
     * The following calling sequence is used when writing the contents
     *                     of an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsWriteStartElement(...)
     * // Write attributes, if any
     * // Write other element content, if any
     * WsWriteType(..., WS_ELEMENT_CONTENT_TYPE_MAPPING, ...)
     * // Write other element content, if any
     * WsWriteEndElement(...)
     * ```
     * 
     * The following calling sequence is used when reading the contents of
     *                     an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsReadToStartElement(...)
     * // Read attributes, if any
     * WsReadStartElement(...)
     * // Read other element content, if any
     * WsReadType(..., WS_ELEMENT_CONTENT_TYPE_MAPPING, ...)
     * // Read other element content, if any
     * WsReadEndElement(...)
     * ```
     * @type {Integer (Int32)}
     */
    static WS_ELEMENT_CONTENT_TYPE_MAPPING => 3

    /**
     * This is used when when the type corresponds to the complete
     *                     element, including the name and namespace of the element.
     *                     The definition may include attributes and child elements
     *                     and text.
     *                 
     * 
     * The following calling sequence is used when writing 
     *                     an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsWriteType(..., WS_ANY_ELEMENT_TYPE_MAPPING, ...)
     * ```
     * 
     * The following calling sequence is used when reading the contents of
     *                     an element:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WsReadToStartElement(...)?
     * WsReadType(..., WS_ANY_ELEMENT_TYPE_MAPPING, ...)
     * ```
     * @type {Integer (Int32)}
     */
    static WS_ANY_ELEMENT_TYPE_MAPPING => 4
}
