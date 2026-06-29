#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IWbemBackupRestore interface backs up and restores the contents of the WMI repository.
 * @remarks
 * The default mode is the same as setting the force mode flag, which breaks all active connections. This results in remote procedure call (RPC) errors from any active COM connections to WMI until new connections are established.
 * 
 * There can be no active connections to the repository during a restore operation. For this reason, the restore operation fails if default parameters are used and there are active connections. A flag can be specified to break all active connections.
 * 
 * <div class="alert"><b>Note</b>  The client making the call must have the proper privilege enabled. Backup requires the <b>SE_RESTORE_NAME</b> privilege, while restoration requires <b>SE_RESTORE_NAME</b>. To enable a privilege, a client application must be running under a user account that has that privilege,  and the privilege must be enabled using the Windows <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> function.</div>
 * <div> </div>
 * For computers running Windows, any local user can make these calls,  but remote users must have the <b>WBEM_FULL_WRITE_REP</b> access right to the root namespace.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbembackuprestore
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemBackupRestore {
    #StructPack 1

}
