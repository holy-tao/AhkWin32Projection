#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SHChangeProductKeyAsIDList structure
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shchangeproductkeyasidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHChangeProductKeyAsIDList extends Win32Struct
{
    static sizeof => 82

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    wszProductKey {
        get => StrGet(this.ptr + 2, 38, "UTF-16")
        set => StrPut(value, this.ptr + 2, 38, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    cbZero {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
