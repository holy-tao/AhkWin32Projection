#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class VALUENAME extends Win32Enum {

    /**
     * Native name: VALUENAME_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: VALUENAME_ENTERPRISE_DEFINED_CLASS_ID
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_DEFINED_CLASS_ID => 1

    /**
     * Native name: VALUENAME_BUILT_IN_LIST
     * @type {Integer (Int32)}
     */
    static BUILT_IN_LIST => 2
}
