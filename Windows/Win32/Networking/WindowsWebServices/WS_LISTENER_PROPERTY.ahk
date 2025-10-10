#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a listener specific setting.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_listener_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_LISTENER_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_ID</a>.
     * @type {Integer}
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
