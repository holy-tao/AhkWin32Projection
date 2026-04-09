#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class FINDFRAME_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FINDFRAME_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FINDFRAME_JUSTTESTEXISTENCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FINDFRAME_INTERNAL => -2147483648
}
