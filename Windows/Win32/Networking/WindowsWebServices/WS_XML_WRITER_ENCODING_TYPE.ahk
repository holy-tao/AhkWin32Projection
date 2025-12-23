#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_WRITER_ENCODING structure.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_ENCODING_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_ENCODING_TYPE_TEXT => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_ENCODING_TYPE_BINARY => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_ENCODING_TYPE_MTOM => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_ENCODING_TYPE_RAW => 4
}
