#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_COLUMN_SET_DATA structure is introduced in MMC 1.2.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_column_set_data
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_COLUMN_SET_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the 
     * MMC_COLUMN_SET_DATA structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of columns in the column set.
     * @type {Integer}
     */
    nNumCols {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_data">MMC_COLUMN_DATA</a> structures that contains the persisted column set data.
     * @type {Pointer<MMC_COLUMN_DATA>}
     */
    pColData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
