#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with setting and retrieving list view column sets whose sort data is stored persistently.
 * @remarks
 * 
 * MMC 1.2 only supports single-column sorting, so the nNumItems member of the 
 * MMC_SORT_SET_DATA structure cannot be greater than 1. Otherwise, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnsortdata">IColumnData::SetColumnSortData</a> will return S_FALSE.
 * 
 * Sorting is disabled on hidden columns. Columns can be hidden or displayed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnconfigdata">IColumnData::SetColumnConfigData</a> method.
 * 
 * The user can hide columns using the Choose Columns dialog.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_sort_set_data
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_SORT_SET_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size of the 
     * MMC_SORT_SET_DATA structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of columns in the column set for which persistent sort data is being set or retrieved. This value can be one of the following:
     * @type {Integer}
     */
    nNumItems {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_data">MMC_SORT_DATA</a> structures that hold the actual sort data. Should be set to <b>NULL</b> if nNumItems is set to 0.
     * @type {Pointer<MMC_SORT_DATA>}
     */
    pSortData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
