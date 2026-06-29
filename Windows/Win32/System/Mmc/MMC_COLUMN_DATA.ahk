#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MMC_COLUMN_DATA structure is introduced in MMC 1.2.
 * @remarks
 * By setting the dwFlags member of the 
 * MMC_COLUMN_DATA structure, a snap-in can hide or show columns in a column set in calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icolumndata-setcolumnconfigdata">IColumnData::SetColumnConfigData</a>. However, column "0" of a column set cannot be hidden. This is to ensure that result pane icons are properly inserted in the first column and that the MMC_VERB_RENAME console verb functions properly.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_column_data
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_COLUMN_DATA {
    #StructPack 8

    /**
     * A zero-based index value of the column.
     */
    nColIndex : Int32

    /**
     * A flag that is defined, HDI_HIDDEN (= 0x0001), which indicates that the column is hidden. The default value for the field is 0, indicating that the column is visible.
     */
    dwFlags : UInt32

    /**
     * Width of the column.
     */
    nWidth : Int32

    /**
     * Not currently used.
     */
    ulReserved : IntPtr

}
