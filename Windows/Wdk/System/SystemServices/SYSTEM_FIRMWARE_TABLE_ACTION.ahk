#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SYSTEM_FIRMWARE_TABLE_ACTION extends Win32Enum {

    /**
     * Native name: SystemFirmwareTable_Enumerate
     * @type {Integer (Int32)}
     */
    static Enumerate => 0

    /**
     * Native name: SystemFirmwareTable_Get
     * @type {Integer (Int32)}
     */
    static Get => 1
}
