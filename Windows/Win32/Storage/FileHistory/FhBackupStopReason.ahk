#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileHistory
 */
export default struct FhBackupStopReason {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
