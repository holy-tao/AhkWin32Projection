#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the four directional buttons used for DVD menu navigation and other operations.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_relative_button
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_RELATIVE_BUTTON extends Win32Enum {

    /**
     * Upper button.
     * Native name: DVD_Relative_Upper
     * @type {Integer (Int32)}
     */
    static Upper => 1

    /**
     * Lower button.
     * Native name: DVD_Relative_Lower
     * @type {Integer (Int32)}
     */
    static Lower => 2

    /**
     * Left button.
     * Native name: DVD_Relative_Left
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * Right button.
     * Native name: DVD_Relative_Right
     * @type {Integer (Int32)}
     */
    static Right => 4
}
