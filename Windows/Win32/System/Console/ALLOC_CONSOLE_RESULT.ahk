#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class ALLOC_CONSOLE_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_RESULT_NO_CONSOLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_RESULT_NEW_CONSOLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLOC_CONSOLE_RESULT_EXISTING_CONSOLE => 2
}
