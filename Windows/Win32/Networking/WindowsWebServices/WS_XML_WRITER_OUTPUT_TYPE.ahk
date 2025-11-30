#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of WS_XML_WRITER_OUTPUT structure.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_xml_writer_output_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_OUTPUT_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_OUTPUT_TYPE_BUFFER => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_XML_WRITER_OUTPUT_TYPE_STREAM => 2
}
