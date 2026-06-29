#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MMC_COLUMN_DATA.ahk" { MMC_COLUMN_DATA }

/**
 * The MMC_COLUMN_SET_DATA structure is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_column_set_data
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_COLUMN_SET_DATA {
    #StructPack 8

    /**
     * The size of the 
     * MMC_COLUMN_SET_DATA structure.
     */
    cbSize : Int32 := this.Size

    /**
     * The number of columns in the column set.
     */
    nNumCols : Int32

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_data">MMC_COLUMN_DATA</a> structures that contains the persisted column set data.
     */
    pColData : MMC_COLUMN_DATA.Ptr

}
