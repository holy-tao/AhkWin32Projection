#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies where the writer should emit the bytes that comprise the xml document.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_writer_output
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_WRITER_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the type of output this structure refers to.
     * @type {Integer}
     */
    outputType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
