#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to remove a filter from the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_rem_filter_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _REM_FILTER_FLAGS{

    /**
     * Leave the filter connected. By default, filters are disconnected when removed from the graph.
     * @type {Integer (Int32)}
     */
    static REMFILTERF_LEAVECONNECTED => 1
}
