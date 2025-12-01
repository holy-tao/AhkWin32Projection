#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * A Boolean value that represents the text &quot;true&quot; or &quot;false&quot;.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_bool_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_BOOL_TEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

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
     * The Boolean value.  0 represents the text "false", while 1 represents the text "true".
     * @type {BOOL}
     */
    value {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
