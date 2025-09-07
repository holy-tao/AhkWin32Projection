#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain the operational state data for a computer.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_operation_state_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_OPERATION_STATE_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_operation_state">DSROLE_OPERATION_STATE</a> values that indicates the computer operational state.
     * @type {Integer}
     */
    OperationState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
