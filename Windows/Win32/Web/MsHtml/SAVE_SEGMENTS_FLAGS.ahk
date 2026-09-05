#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class SAVE_SEGMENTS_FLAGS extends Win32Enum {

    /**
     * Native name: SAVE_SEGMENTS_NoIE4SelectionCompat
     * @type {Integer (Int32)}
     */
    static NoIE4SelectionCompat => 1

    /**
     * Native name: SAVE_SEGMENTS_FLAGS_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
