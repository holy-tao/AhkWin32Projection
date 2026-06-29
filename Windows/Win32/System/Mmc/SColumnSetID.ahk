#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SColumnSetID structure is introduced in MMC 1.2.
 * @remarks
 * For details on using the 
 * <b>SColumnSetID</b> structure with the CCF_COLUMN_SET_ID clipboard format, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-column-set-id">CCF_COLUMN_SET_ID</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-scolumnsetid
 * @namespace Windows.Win32.System.Mmc
 */
export default struct SColumnSetID {
    #StructPack 4

    /**
     * Reserved for future use. Must be 0.
     */
    dwFlags : UInt32

    /**
     * The count of bytes in the <b>id</b> array.
     */
    cBytes : UInt32

    /**
     * The bytes that contains the column set ID.
     */
    id : Int8[1]

}
