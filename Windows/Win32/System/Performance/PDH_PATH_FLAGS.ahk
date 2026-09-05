#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PDH_PATH_FLAGS extends Win32Enum {

    /**
     * Native name: PDH_PATH_WBEM_RESULT
     * @type {Integer (UInt32)}
     */
    static WBEM_RESULT => 1

    /**
     * Native name: PDH_PATH_WBEM_INPUT
     * @type {Integer (UInt32)}
     */
    static WBEM_INPUT => 2

    /**
     * Native name: PDH_PATH_WBEM_NONE
     * @type {Integer (UInt32)}
     */
    static WBEM_NONE => 0
}
