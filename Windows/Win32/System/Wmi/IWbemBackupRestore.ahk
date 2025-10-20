#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemBackupRestore interface backs up and restores the contents of the WMI repository.
 * @remarks
 * 
  * The default mode is the same as setting the force mode flag, which breaks all active connections. This results in remote procedure call (RPC) errors from any active COM connections to WMI until new connections are established.
  * 
  * There can be no active connections to the repository during a restore operation. For this reason, the restore operation fails if default parameters are used and there are active connections. A flag can be specified to break all active connections.
  * 
  * <div class="alert"><b>Note</b>  The client making the call must have the proper privilege enabled. Backup requires the <b>SE_RESTORE_NAME</b> privilege, while restoration requires <b>SE_RESTORE_NAME</b>. To enable a privilege, a client application must be running under a user account that has that privilege,  and the privilege must be enabled using the Windows <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> function.</div>
  * <div> </div>
  * For computers running Windows, any local user can make these calls,  but remote users must have the <b>WBEM_FULL_WRITE_REP</b> access right to the root namespace.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbembackuprestore
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemBackupRestore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemBackupRestore
     * @type {Guid}
     */
    static IID => Guid("{c49e32c7-bc8b-11d2-85d4-00105a1f8304}")

    /**
     * The class identifier for WbemBackupRestore
     * @type {Guid}
     */
    static CLSID => Guid("{c49e32c6-bc8b-11d2-85d4-00105a1f8304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Backup", "Restore"]

    /**
     * 
     * @param {PWSTR} strBackupToFile 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestore-backup
     */
    Backup(strBackupToFile, lFlags) {
        strBackupToFile := strBackupToFile is String ? StrPtr(strBackupToFile) : strBackupToFile

        result := ComCall(3, this, "ptr", strBackupToFile, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} strRestoreFromFile 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestore-restore
     */
    Restore(strRestoreFromFile, lFlags) {
        strRestoreFromFile := strRestoreFromFile is String ? StrPtr(strRestoreFromFile) : strRestoreFromFile

        result := ComCall(4, this, "ptr", strRestoreFromFile, "int", lFlags, "HRESULT")
        return result
    }
}
