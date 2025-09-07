#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents types of statistics that convey information about a component.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_statistics
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_STATISTICS{

    /**
     * Indicates that the statistic represents the number of ranges that are contained in an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncknowledge">ISyncKnowledge</a> object.
     * @type {Integer (Int32)}
     */
    static SYNC_STATISTICS_RANGE_COUNT => 0
}
