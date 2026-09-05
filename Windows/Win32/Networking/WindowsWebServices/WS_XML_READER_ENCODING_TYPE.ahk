#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_READER_ENCODING structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_reader_encoding_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_READER_ENCODING_TYPE extends Win32Enum {

    /**
     * Native name: WS_XML_READER_ENCODING_TYPE_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 1

    /**
     * Native name: WS_XML_READER_ENCODING_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static BINARY => 2

    /**
     * Native name: WS_XML_READER_ENCODING_TYPE_MTOM
     * @type {Integer (Int32)}
     */
    static MTOM => 3

    /**
     * Native name: WS_XML_READER_ENCODING_TYPE_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 4
}
