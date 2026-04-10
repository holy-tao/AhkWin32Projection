#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTY_ID.ahk

/**
 * Specifies a security binding specific setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURITY_BINDING_PROPERTY extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_ID</a>.
     * @type {WS_SECURITY_BINDING_PROPERTY_ID}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to the value to set.
     *                 The pointer must have an alignment compatible with the type
     *                 of the property.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the memory pointed to by value.
     * @type {Integer}
     */
    valueSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
