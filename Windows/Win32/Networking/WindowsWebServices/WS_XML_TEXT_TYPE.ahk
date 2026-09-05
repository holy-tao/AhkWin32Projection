#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_TEXT structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_text_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_TEXT_TYPE extends Win32Enum {

    /**
     * Characters encoded as UTF-8 bytes.
     * Native name: WS_XML_TEXT_TYPE_UTF8
     * @type {Integer (Int32)}
     */
    static UTF8 => 1

    /**
     * Characters encoded as UTF-16 bytes.
     * Native name: WS_XML_TEXT_TYPE_UTF16
     * @type {Integer (Int32)}
     */
    static UTF16 => 2

    /**
     * Bytes that represent base64 encoded text.
     * Native name: WS_XML_TEXT_TYPE_BASE64
     * @type {Integer (Int32)}
     */
    static BASE64 => 3

    /**
     * A Boolean value that represents the text "true" or "false"
     * Native name: WS_XML_TEXT_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static BOOL => 4

    /**
     * A signed 32 bit integer value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 5

    /**
     * A signed 64 bit integer value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 6

    /**
     * An unsigned 64 bit integer value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 7

    /**
     * An 4 byte floating point value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 8

    /**
     * An 8 byte floating point value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 9

    /**
     * A 12 byte fixed point value that represents the text of the value as base 10 characters.
     * Native name: WS_XML_TEXT_TYPE_DECIMAL
     * @type {Integer (Int32)}
     */
    static DECIMAL => 10

    /**
     * A GUID that represents the text "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
     * Native name: WS_XML_TEXT_TYPE_GUID
     * @type {Integer (Int32)}
     */
    static GUID => 11

    /**
     * A GUID that represents the text "urn:uuid:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
     * Native name: WS_XML_TEXT_TYPE_UNIQUE_ID
     * @type {Integer (Int32)}
     */
    static UNIQUE_ID => 12

    /**
     * A datetime.
     * Native name: WS_XML_TEXT_TYPE_DATETIME
     * @type {Integer (Int32)}
     */
    static DATETIME => 13

    /**
     * A timespan.
     * Native name: WS_XML_TEXT_TYPE_TIMESPAN
     * @type {Integer (Int32)}
     */
    static TIMESPAN => 14

    /**
     * A qualified name.
     * Native name: WS_XML_TEXT_TYPE_QNAME
     * @type {Integer (Int32)}
     */
    static QNAME => 15

    /**
     * A list of values that represent their text forms separated by a single whitespace character.
     * Native name: WS_XML_TEXT_TYPE_LIST
     * @type {Integer (Int32)}
     */
    static LIST => 16
}
