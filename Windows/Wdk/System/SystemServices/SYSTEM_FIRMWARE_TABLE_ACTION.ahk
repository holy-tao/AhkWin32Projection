#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SYSTEM_FIRMWARE_TABLE_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SystemFirmwareTable_Enumerate => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemFirmwareTable_Get => 1
}
