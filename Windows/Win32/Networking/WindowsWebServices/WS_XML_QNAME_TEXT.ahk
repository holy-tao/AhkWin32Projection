#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * Represents a qname formatted as the text &quot;prefix:localName&quot;
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_qname_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_QNAME_TEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(this.ptr + 0)
            return this.__text
        }
    }

    /**
     * The prefix.
     * @type {Pointer<WS_XML_STRING>}
     */
    prefix {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The local name.
     * @type {Pointer<WS_XML_STRING>}
     */
    localName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<WS_XML_STRING>}
     */
    ns {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
