#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IF_ENTRY_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MibIfEntryNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static MibIfEntryNormalWithoutStatistics => 2
}
