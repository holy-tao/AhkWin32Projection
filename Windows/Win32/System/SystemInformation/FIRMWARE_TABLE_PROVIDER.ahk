#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class FIRMWARE_TABLE_PROVIDER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI => 1094930505

    /**
     * @type {Integer (UInt32)}
     */
    static FIRM => 1179210317

    /**
     * @type {Integer (UInt32)}
     */
    static RSMB => 1381190978
}
