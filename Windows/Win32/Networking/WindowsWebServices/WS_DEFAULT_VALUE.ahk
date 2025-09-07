#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a default value for a field. This is used in a WS_FIELD_DESCRIPTION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_value
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DEFAULT_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the default value.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the default value, in bytes.
     * @type {Integer}
     */
    valueSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
