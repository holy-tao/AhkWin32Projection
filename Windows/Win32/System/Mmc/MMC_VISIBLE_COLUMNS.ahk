#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by MMC with the MMCN_COLUMNS_CHANGED notification to inform the snap-in which columns in a column set are visible.
 * @remarks
 * The value of rgVisibleCols[0] is always 0 (zero), indicating that the first visible column in the list view is always the zero index-valued column, which must always be the first column and must always be visible. Furthermore, MMC does not allow the user to change the position of the first column.
 * 
 * The order of visible columns may be different than the order of insertion by the snap-in because the user may have rearranged the columns by dragging and dropping their headers.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_visible_columns
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_VISIBLE_COLUMNS {
    #StructPack 4

    /**
     * The number of visible columns in the column set.
     */
    nVisibleColumns : Int32

    /**
     * A variable-length array in which each member contains the zero-based number of a visible column. The ordering of the columns in the array corresponds to the order of the columns as they appear in the list view. The nVisibleColumns member gives the number of elements in the list.
     */
    rgVisibleCols : Int32[1]

}
