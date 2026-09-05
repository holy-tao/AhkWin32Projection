#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class REAL_TIME_DATA_SOURCE_ID_FLAGS extends Win32Enum {

    /**
     * Native name: DATA_SOURCE_REGISTRY
     * @type {Integer (UInt32)}
     */
    static REGISTRY => 1

    /**
     * Native name: DATA_SOURCE_WBEM
     * @type {Integer (UInt32)}
     */
    static WBEM => 4
}
