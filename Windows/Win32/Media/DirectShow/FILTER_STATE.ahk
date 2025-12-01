#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a filter's state or the state of the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-filter_state
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class FILTER_STATE extends Win32Enum{

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
