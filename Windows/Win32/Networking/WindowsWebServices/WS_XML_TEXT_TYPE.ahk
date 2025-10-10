#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type of WS_XML_TEXT structure.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_xml_text_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_TEXT_TYPE{

    /**
     * Characters encoded as UTF-8 bytes.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_UTF8 => 1

    /**
     * Characters encoded as UTF-16 bytes.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_UTF16 => 2

    /**
     * Bytes that represent base64 encoded text.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_BASE64 => 3

    /**
     * A Boolean value that represents the text "true" or "false"
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_BOOL => 4

    /**
     * A signed 32 bit integer value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_INT32 => 5

    /**
     * A signed 64 bit integer value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_INT64 => 6

    /**
     * An unsigned 64 bit integer value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_UINT64 => 7

    /**
     * An 4 byte floating point value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_FLOAT => 8

    /**
     * An 8 byte floating point value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_DOUBLE => 9

    /**
     * A 12 byte fixed point value that represents the text of the value as base 10 characters.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_DECIMAL => 10

    /**
     * A GUID that represents the text "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_GUID => 11

    /**
     * A GUID that represents the text "urn:uuid:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_UNIQUE_ID => 12

    /**
     * A datetime.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_DATETIME => 13

    /**
     * A timespan.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_TIMESPAN => 14

    /**
     * A qualified name.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_QNAME => 15

    /**
     * A list of values that represent their text forms separated by a single whitespace character.
     * @type {Integer (Int32)}
     */
    static WS_XML_TEXT_TYPE_LIST => 16
}
