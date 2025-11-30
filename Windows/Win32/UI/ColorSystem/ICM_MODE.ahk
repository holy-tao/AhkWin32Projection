#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class ICM_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ICM_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICM_ON => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICM_QUERY => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICM_DONE_OUTSIDEDC => 4
}
