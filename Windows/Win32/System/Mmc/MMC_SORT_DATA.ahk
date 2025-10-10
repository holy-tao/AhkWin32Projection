#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the column sort data of a single column in a column set.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_sort_data
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_SORT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A zero-based index value of the column.
     * @type {Integer}
     */
    nColIndex {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Sort options to be used during the sort operation. This value can be a combination of the following:
     * @type {Integer}
     */
    dwSortOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for future use.
     * @type {Pointer}
     */
    ulReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
