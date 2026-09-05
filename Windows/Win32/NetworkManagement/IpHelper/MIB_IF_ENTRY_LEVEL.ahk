#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IF_ENTRY_LEVEL extends Win32Enum {

    /**
     * Native name: MibIfEntryNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: MibIfEntryNormalWithoutStatistics
     * @type {Integer (Int32)}
     */
    static NormalWithoutStatistics => 2
}
