#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SNodeID2 structure is introduced in MMC 1.2, and replaces the SNodeID structure.
 * @remarks
 * For details on using the 
 * <b>SNodeID2</b> structure with the CCF_NODEID2 clipboard format, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-nodeid2">CCF_NODEID2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-snodeid2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct SNodeID2 {
    #StructPack 4

    /**
     * Currently, only the MMC_NODEID_SLOW_RETRIEVAL flag is defined for <b>dwFlags</b>. If this flag is set, MMC will not persist the specified scope item except where absolutely necessary, as for example for console taskpads. Console taskpads always persist the target items and task target items.
     */
    dwFlags : UInt32

    /**
     * The count of bytes in the <b>id</b> array.
     */
    cBytes : UInt32

    /**
     * The bytes that contains the node ID of the scope item.
     */
    id : Int8[1]

}
