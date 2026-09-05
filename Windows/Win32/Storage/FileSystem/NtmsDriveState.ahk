#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsDriveState extends Win32Enum {

    /**
     * Native name: NTMS_DRIVESTATE_DISMOUNTED
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_DISMOUNTED => 0

    /**
     * Native name: NTMS_DRIVESTATE_MOUNTED
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_MOUNTED => 1

    /**
     * Native name: NTMS_DRIVESTATE_LOADED
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_LOADED => 2

    /**
     * Native name: NTMS_DRIVESTATE_UNLOADED
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_UNLOADED => 5

    /**
     * Native name: NTMS_DRIVESTATE_BEING_CLEANED
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_BEING_CLEANED => 6

    /**
     * Native name: NTMS_DRIVESTATE_DISMOUNTABLE
     * @type {Integer (Int32)}
     */
    static DRIVESTATE_DISMOUNTABLE => 7
}
