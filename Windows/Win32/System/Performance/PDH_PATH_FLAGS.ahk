#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_PATH_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PATH_WBEM_RESULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PATH_WBEM_INPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PATH_WBEM_NONE => 0
}
