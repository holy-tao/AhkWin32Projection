#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class SAVE_SEGMENTS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SAVE_SEGMENTS_NoIE4SelectionCompat => 1

    /**
     * @type {Integer (Int32)}
     */
    static SAVE_SEGMENTS_FLAGS_Max => 2147483647
}
