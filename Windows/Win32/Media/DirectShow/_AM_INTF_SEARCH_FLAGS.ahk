#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the types of object to search, when attempting to find an interface on the filter graph.
 * @remarks
 * If no flags are set (the default case), it is equivalent to the bitwise <b>OR</b> of all the flags. All filters and pins are searched.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_am_intf_search_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _AM_INTF_SEARCH_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
