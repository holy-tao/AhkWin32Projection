#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CAT_MEMBERINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszSubjGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCertVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
