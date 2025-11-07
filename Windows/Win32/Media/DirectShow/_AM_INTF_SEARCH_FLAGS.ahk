#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of object to search, when attempting to find an interface on the filter graph.
 * @remarks
 * 
 * If no flags are set (the default case), it is equivalent to the bitwise <b>OR</b> of all the flags. All filters and pins are searched.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_am_intf_search_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AM_INTF_SEARCH_FLAGS{

    /**
     * Search input pins.
     * @type {Integer (Int32)}
     */
    static AM_INTF_SEARCH_INPUT_PIN => 1

    /**
     * Search output pins.
     * @type {Integer (Int32)}
     */
    static AM_INTF_SEARCH_OUTPUT_PIN => 2

    /**
     * Search filters.
     * @type {Integer (Int32)}
     */
    static AM_INTF_SEARCH_FILTER => 4
}
