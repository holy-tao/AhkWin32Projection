#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsDriveState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_DISMOUNTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_MOUNTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_LOADED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_UNLOADED => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_BEING_CLEANED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_DISMOUNTABLE => 7
}
