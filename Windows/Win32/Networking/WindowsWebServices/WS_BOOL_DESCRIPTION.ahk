#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies constraints on the set of values which can be deserialized. (WS_BOOL_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_bool_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_BOOL_DESCRIPTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the required value.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
