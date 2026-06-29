#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSROLE_OPERATION_STATE.ahk" { DSROLE_OPERATION_STATE }

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain the operational state data for a computer.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_operation_state_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSROLE_OPERATION_STATE_INFO {
    #StructPack 4

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_operation_state">DSROLE_OPERATION_STATE</a> values that indicates the computer operational state.
     */
    OperationState : DSROLE_OPERATION_STATE

}
