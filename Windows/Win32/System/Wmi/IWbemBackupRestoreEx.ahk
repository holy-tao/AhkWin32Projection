#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemBackupRestore.ahk

/**
 * The IWbemBackupRestoreEx interface backs up and restores the contents of the repository.
 * @remarks
 * 
  * The default mode is the same as setting the force mode flag, which breaks all active connections. This results in remote procedure call (RPC) errors from any active COM connections to WMI until new connections are established.
  * 
  * There can be no active connections to the repository during a restore operation. For this reason, the restore operation fails if default parameters are used and there are active connections. A flag can be specified to break all active connections.
  * 
  * The client making the call must have the correct privilege enabled. Backup requires the <b>SE_RESTORE_NAME</b> privilege, and restoration requires <b>SE_RESTORE_NAME</b>. To enable a privilege, a client application must be running under a user account that has that privilege, and the privilege must be enabled using the Windows <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> function.
  * 
  * Any local user can make these calls, but remote users must have the <b>WBEM_FULL_WRITE_REP</b> access right to the root namespace.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbembackuprestoreex
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemBackupRestoreEx extends IWbemBackupRestore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemBackupRestoreEx
     * @type {Guid}
     */
    static IID => Guid("{a359dec5-e813-4834-8a2a-ba7f1d777d76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Pause", "Resume"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
