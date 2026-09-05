#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class STD_HANDLE extends Win32Enum {

    /**
     * Native name: STD_INPUT_HANDLE
     * @type {Integer (UInt32)}
     */
    static INPUT_HANDLE => 4294967286

    /**
     * Native name: STD_OUTPUT_HANDLE
     * @type {Integer (UInt32)}
     */
    static OUTPUT_HANDLE => 4294967285

    /**
     * Native name: STD_ERROR_HANDLE
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLE => 4294967284
}
