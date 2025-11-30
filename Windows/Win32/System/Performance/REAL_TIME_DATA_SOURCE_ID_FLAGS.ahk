#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class REAL_TIME_DATA_SOURCE_ID_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DATA_SOURCE_REGISTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DATA_SOURCE_WBEM => 4
}
