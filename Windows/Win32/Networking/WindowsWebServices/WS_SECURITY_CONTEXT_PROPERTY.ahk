#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a property of a WS_SECURITY_CONTEXT
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The identifier of the property.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The property value.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the property value
     * @type {Integer}
     */
    valueSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
