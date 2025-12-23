#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the IResultOwnerData::FindItem method to support keyboard navigation in virtual lists in the result pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-resultfindinfo
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class RESULTFINDINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Null-terminated string to match.
     * @type {PWSTR}
     */
    psz {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Index at which to start search.
     * @type {Integer}
     */
    nStart {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * One or both of the following flags:
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
