#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_DTLS_MTU extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * @type {Integer}
     */
    PathMTU {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
