#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the column sort data of a single column in a column set.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_sort_data
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_SORT_DATA {
    #StructPack 8

    /**
     * A zero-based index value of the column.
     */
    nColIndex : Int32

    /**
     * Sort options to be used during the sort operation. This value can be a combination of the following:
     */
    dwSortOptions : UInt32

    /**
     * Reserved for future use.
     */
    ulReserved : IntPtr

}
