#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileHistory
 */
class FhBackupStopReason extends Win32Enum {

    /**
     * Native name: BackupInvalidStopReason
     * @type {Integer (Int32)}
     */
    static InvalidStopReason => 0

    /**
     * Native name: BackupLimitUserBusyMachineOnAC
     * @type {Integer (Int32)}
     */
    static LimitUserBusyMachineOnAC => 1

    /**
     * Native name: BackupLimitUserIdleMachineOnDC
     * @type {Integer (Int32)}
     */
    static LimitUserIdleMachineOnDC => 2

    /**
     * Native name: BackupLimitUserBusyMachineOnDC
     * @type {Integer (Int32)}
     */
    static LimitUserBusyMachineOnDC => 3

    /**
     * Native name: BackupCancelled
     * @type {Integer (Int32)}
     */
    static Cancelled => 4
}
