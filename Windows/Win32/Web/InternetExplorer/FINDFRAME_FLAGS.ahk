#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class FINDFRAME_FLAGS extends Win32Enum {

    /**
     * Native name: FINDFRAME_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: FINDFRAME_JUSTTESTEXISTENCE
     * @type {Integer (Int32)}
     */
    static JUSTTESTEXISTENCE => 1

    /**
     * Native name: FINDFRAME_INTERNAL
     * @type {Integer (Int32)}
     */
    static INTERNAL => -2147483648
}
