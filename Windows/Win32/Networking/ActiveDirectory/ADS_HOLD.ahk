#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_HOLD structure is an ADSI representation of the Hold attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_hold
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_HOLD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the name of an object put on hold.
     * @type {PWSTR}
     */
    ObjectName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of charges that a server places against the user on hold while it verifies the user account balance.
     * @type {Integer}
     */
    Amount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
