#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the four directional buttons used for DVD menu navigation and other operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_relative_button
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_RELATIVE_BUTTON{

    /**
     * Upper button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Upper => 1

    /**
     * Lower button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Lower => 2

    /**
     * Left button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Left => 3

    /**
     * Right button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Right => 4
}
