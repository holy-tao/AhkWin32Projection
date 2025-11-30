#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MSVidCtlButtonstate extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_LEFT_BUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_RIGHT_BUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_MIDDLE_BUTTON => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_X_BUTTON1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_X_BUTTON2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_SHIFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_CTRL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_ALT => 4
}
