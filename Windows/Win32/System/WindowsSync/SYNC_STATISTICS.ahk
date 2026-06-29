#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents types of statistics that convey information about a component.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_statistics
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_STATISTICS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the statistic represents the number of ranges that are contained in an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncknowledge">ISyncKnowledge</a> object.
     * @type {Integer (Int32)}
     */
    static SYNC_STATISTICS_RANGE_COUNT => 0
}
