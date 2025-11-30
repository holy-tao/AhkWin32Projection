#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELLBROWSERSHOWCONTROL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SBSC_HIDE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SBSC_SHOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static SBSC_TOGGLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SBSC_QUERY => 3
}
