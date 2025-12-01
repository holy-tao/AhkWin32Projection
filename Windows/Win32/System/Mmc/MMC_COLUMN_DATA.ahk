#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_COLUMN_DATA structure is introduced in MMC 1.2.
 * @remarks
 * By setting the dwFlags member of the 
 * MMC_COLUMN_DATA structure, a snap-in can hide or show columns in a column set in calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnconfigdata">IColumnData::SetColumnConfigData</a>. However, column "0" of a column set cannot be hidden. This is to ensure that result pane icons are properly inserted in the first column and that the MMC_VERB_RENAME console verb functions properly.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_column_data
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_COLUMN_DATA extends Win32Struct
{
    static sizeof => 24

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
     * A flag that is defined, HDI_HIDDEN (= 0x0001), which indicates that the column is hidden. The default value for the field is 0, indicating that the column is visible.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Width of the column.
     * @type {Integer}
     */
    nWidth {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Not currently used.
     * @type {Pointer}
     */
    ulReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
