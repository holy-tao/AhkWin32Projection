#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is the base type for all the different kinds of reader encodings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_encoding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_READER_ENCODING extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the type of encoding this structure refers to.
     * @type {Integer}
     */
    encodingType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
