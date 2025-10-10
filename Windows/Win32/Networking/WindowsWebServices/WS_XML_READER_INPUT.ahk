#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies where the reader should obtain the bytes that comprise the xml document.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_reader_input
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_INPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_reader_input_type">WS_XML_READER_INPUT_TYPE</a> enumeration that
     *           indicates the type of input to which this structure refers.
     * @type {Integer}
     */
    inputType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
