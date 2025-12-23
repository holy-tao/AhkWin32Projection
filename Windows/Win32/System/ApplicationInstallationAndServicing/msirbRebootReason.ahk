#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msirbRebootReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootUndeterminedReason => 0

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootInUseFilesReason => 1

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootScheduleRebootReason => 2

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootForceRebootReason => 3

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootCustomActionReason => 4
}
