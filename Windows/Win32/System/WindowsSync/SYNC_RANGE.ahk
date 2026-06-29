#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a range of item IDs.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-sync_range
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_RANGE {
    #StructPack 8

    /**
     * The closed lower bound of item IDs that are contained in the range.
     */
    pbClosedLowerBound : IntPtr

    /**
     * The closed upper bound of item IDs that are contained in the range.
     */
    pbClosedUpperBound : IntPtr

}
