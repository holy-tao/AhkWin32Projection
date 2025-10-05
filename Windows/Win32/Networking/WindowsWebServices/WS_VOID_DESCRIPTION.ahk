#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies information about a field which is neither serialized nor deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_void_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_VOID_DESCRIPTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The size of the field.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
