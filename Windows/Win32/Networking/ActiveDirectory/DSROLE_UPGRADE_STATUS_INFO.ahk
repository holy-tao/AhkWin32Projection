#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to contain domain upgrade status data.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ns-dsrole-dsrole_upgrade_status_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_UPGRADE_STATUS_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    OperationState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If an upgrade is in progress, this member contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_server_state">DSROLE_SERVER_STATE</a> values that indicate the previous role of the server.
     * @type {Integer}
     */
    PreviousServerState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
