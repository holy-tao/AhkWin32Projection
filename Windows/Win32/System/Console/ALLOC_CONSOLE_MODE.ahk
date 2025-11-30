#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class ALLOC_CONSOLE_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_MODE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_MODE_NEW_WINDOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_MODE_NO_WINDOW => 2
}
