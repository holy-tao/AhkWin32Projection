#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with the DSROLE_OPERATION_STATE_INFO structure to indicate the operational state of a computer.
 * @see https://docs.microsoft.com/windows/win32/api//dsrole/ne-dsrole-dsrole_operation_state
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_OPERATION_STATE extends Win32Enum{

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
