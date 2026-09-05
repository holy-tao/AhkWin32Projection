#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a filter's state or the state of the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-filter_state
 * @namespace Windows.Win32.Media.DirectShow
 */
class FILTER_STATE extends Win32Enum {

    /**
     * Stopped. The filter is not processing data.
     * Native name: State_Stopped
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * Paused. The filter is processing data, but not rendering it.
     * Native name: State_Paused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * Running. The filter is processing and rendering data.
     * Native name: State_Running
     * @type {Integer (Int32)}
     */
    static Running => 2
}
