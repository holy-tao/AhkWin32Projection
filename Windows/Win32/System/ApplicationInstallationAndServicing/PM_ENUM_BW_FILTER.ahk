#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ENUM_BW_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BW_FILTER_BOOTWORKER_ALL => 31

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BW_FILTER_BY_TASKID => 32

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BW_FILTER_MAX => 33
}
