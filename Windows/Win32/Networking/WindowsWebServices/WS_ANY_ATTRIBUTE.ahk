#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_STRING.ahk

/**
 * This type is used to store an attribute that has not been directly mapped to a field.
 * @remarks
 * This structure is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_any_attributes">WS_ANY_ATTRIBUTES</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_any_attribute
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ANY_ATTRIBUTE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies the localName of the attribute.
     * @type {WS_XML_STRING}
     */
    localName{
        get {
            if(!this.HasProp("__localName"))
                this.__localName := WS_XML_STRING(this.ptr + 0)
            return this.__localName
        }
    }

    /**
     * Specifies the namespace of the attribute.
     * @type {WS_XML_STRING}
     */
    ns{
        get {
            if(!this.HasProp("__ns"))
                this.__ns := WS_XML_STRING(this.ptr + 32)
            return this.__ns
        }
    }

    /**
     * Specifies the value of the attribute.  This
     *                     field may not be <b>NULL</b>.
     * @type {Pointer<WS_XML_TEXT>}
     */
    value {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
