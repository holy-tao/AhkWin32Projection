#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKTOP_SLIDESHOW_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DSD_FORWARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static DSD_BACKWARD => 1
}
