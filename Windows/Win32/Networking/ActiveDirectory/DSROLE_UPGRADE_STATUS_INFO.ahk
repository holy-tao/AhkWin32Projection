#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSROLE_SERVER_STATE.ahk" { DSROLE_SERVER_STATE }

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain domain upgrade status data.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_upgrade_status_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSROLE_UPGRADE_STATUS_INFO {
    #StructPack 4

    OperationState : UInt32

    /**
     * If an upgrade is in progress, this member contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_server_state">DSROLE_SERVER_STATE</a> values that indicate the previous role of the server.
     */
    PreviousServerState : DSROLE_SERVER_STATE

}
