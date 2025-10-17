#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_FULL_SET_INFO extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    ShutDownOnFull {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
