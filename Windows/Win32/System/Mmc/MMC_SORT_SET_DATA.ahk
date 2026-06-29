#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MMC_SORT_DATA.ahk" { MMC_SORT_DATA }

/**
 * Used with setting and retrieving list view column sets whose sort data is stored persistently.
 * @remarks
 * MMC 1.2 only supports single-column sorting, so the nNumItems member of the 
 * MMC_SORT_SET_DATA structure cannot be greater than 1. Otherwise, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnsortdata">IColumnData::SetColumnSortData</a> will return S_FALSE.
 * 
 * Sorting is disabled on hidden columns. Columns can be hidden or displayed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnconfigdata">IColumnData::SetColumnConfigData</a> method.
 * 
 * The user can hide columns using the Choose Columns dialog.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_sort_set_data
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_SORT_SET_DATA {
    #StructPack 8

    /**
     * Size of the 
     * MMC_SORT_SET_DATA structure.
     */
    cbSize : Int32 := this.Size

    /**
     * The number of columns in the column set for which persistent sort data is being set or retrieved. This value can be one of the following:
     */
    nNumItems : Int32

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_data">MMC_SORT_DATA</a> structures that hold the actual sort data. Should be set to <b>NULL</b> if nNumItems is set to 0.
     */
    pSortData : MMC_SORT_DATA.Ptr

}
