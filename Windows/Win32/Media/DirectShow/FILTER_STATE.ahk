#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a filter's state or the state of the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-filter_state
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct FILTER_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Stopped. The filter is not processing data.
     * @type {Integer (Int32)}
     */
    static State_Stopped => 0

    /**
     * Paused. The filter is processing data, but not rendering it.
     * @type {Integer (Int32)}
     */
    static State_Paused => 1

    /**
     * Running. The filter is processing and rendering data.
     * @type {Integer (Int32)}
     */
    static State_Running => 2
}
