#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class ALLOC_CONSOLE_RESULT extends Win32Enum {

    /**
     * Native name: ALLOC_CONSOLE_RESULT_NO_CONSOLE
     * @type {Integer (Int32)}
     */
    static NO_CONSOLE => 0

    /**
     * Native name: ALLOC_CONSOLE_RESULT_NEW_CONSOLE
     * @type {Integer (Int32)}
     */
    static NEW_CONSOLE => 1

    /**
     * Native name: ALLOC_CONSOLE_RESULT_EXISTING_CONSOLE
     * @type {Integer (Int32)}
     */
    static EXISTING_CONSOLE => 2
}
