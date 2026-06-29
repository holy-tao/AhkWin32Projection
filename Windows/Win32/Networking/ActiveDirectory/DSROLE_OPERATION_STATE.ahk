#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the DSROLE_OPERATION_STATE_INFO structure to indicate the operational state of a computer.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ne-dsrole-dsrole_operation_state
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSROLE_OPERATION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The computer is idle.
     * @type {Integer (Int32)}
     */
    static DsRoleOperationIdle => 0

    /**
     * The computer is active.
     * @type {Integer (Int32)}
     */
    static DsRoleOperationActive => 1

    /**
     * The computer requires a restart.
     * @type {Integer (Int32)}
     */
    static DsRoleOperationNeedReboot => 2
}
