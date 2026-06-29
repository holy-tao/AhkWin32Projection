#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to remove a filter from the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_rem_filter_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _REM_FILTER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Leave the filter connected. By default, filters are disconnected when removed from the graph.
     * @type {Integer (Int32)}
     */
    static REMFILTERF_LEAVECONNECTED => 1
}
