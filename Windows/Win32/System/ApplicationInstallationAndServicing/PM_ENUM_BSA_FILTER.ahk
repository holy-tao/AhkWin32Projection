#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ENUM_BSA_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_ALL => 26

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_TASKID => 27

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_PRODUCTID => 28

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_PERIODIC => 29

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_BY_ALL_LAUNCHONBOOT => 30

    /**
     * @type {Integer (Int32)}
     */
    static PM_ENUM_BSA_FILTER_MAX => 31
}
