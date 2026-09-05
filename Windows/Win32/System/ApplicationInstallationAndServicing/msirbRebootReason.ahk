#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msirbRebootReason extends Win32Enum {

    /**
     * Native name: msirbRebootUndeterminedReason
     * @type {Integer (Int32)}
     */
    static UndeterminedReason => 0

    /**
     * Native name: msirbRebootInUseFilesReason
     * @type {Integer (Int32)}
     */
    static InUseFilesReason => 1

    /**
     * Native name: msirbRebootScheduleRebootReason
     * @type {Integer (Int32)}
     */
    static ScheduleRebootReason => 2

    /**
     * Native name: msirbRebootForceRebootReason
     * @type {Integer (Int32)}
     */
    static ForceRebootReason => 3

    /**
     * Native name: msirbRebootCustomActionReason
     * @type {Integer (Int32)}
     */
    static CustomActionReason => 4
}
