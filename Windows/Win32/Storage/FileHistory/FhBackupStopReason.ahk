#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FhBackupStopReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BackupInvalidStopReason => 0

    /**
     * @type {Integer (Int32)}
     */
    static BackupLimitUserBusyMachineOnAC => 1

    /**
     * @type {Integer (Int32)}
     */
    static BackupLimitUserIdleMachineOnDC => 2

    /**
     * @type {Integer (Int32)}
     */
    static BackupLimitUserBusyMachineOnDC => 3

    /**
     * @type {Integer (Int32)}
     */
    static BackupCancelled => 4
}
