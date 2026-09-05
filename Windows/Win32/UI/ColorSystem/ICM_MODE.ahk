#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
class ICM_MODE extends Win32Enum {

    /**
     * Native name: ICM_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 1

    /**
     * Native name: ICM_ON
     * @type {Integer (Int32)}
     */
    static ON => 2

    /**
     * Native name: ICM_QUERY
     * @type {Integer (Int32)}
     */
    static QUERY => 3

    /**
     * Native name: ICM_DONE_OUTSIDEDC
     * @type {Integer (Int32)}
     */
    static DONE_OUTSIDEDC => 4
}
