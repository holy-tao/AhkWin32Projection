#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * Represents base64 encoded data.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_base64_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_BASE64_TEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(0, this)
            return this.__text
        }
    }

    /**
     * The bytes of data.
     * @type {Pointer<Integer>}
     */
    bytes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length of the bytes of data.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
