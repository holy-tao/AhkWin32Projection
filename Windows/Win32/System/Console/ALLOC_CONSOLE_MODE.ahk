#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class ALLOC_CONSOLE_MODE extends Win32Enum {

    /**
     * Native name: ALLOC_CONSOLE_MODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: ALLOC_CONSOLE_MODE_NEW_WINDOW
     * @type {Integer (Int32)}
     */
    static NEW_WINDOW => 1

    /**
     * Native name: ALLOC_CONSOLE_MODE_NO_WINDOW
     * @type {Integer (Int32)}
     */
    static NO_WINDOW => 2
}
