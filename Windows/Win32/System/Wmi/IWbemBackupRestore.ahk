#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

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
export default struct IWbemBackupRestore extends IUnknown {
    /**
     * The interface identifier for IWbemBackupRestore
     * @type {Guid}
     */
    static IID := Guid("{c49e32c7-bc8b-11d2-85d4-00105a1f8304}")

    /**
     * The class identifier for WbemBackupRestore
     * @type {Guid}
     */
    static CLSID := Guid("{c49e32c6-bc8b-11d2-85d4-00105a1f8304}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemBackupRestore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Backup  : IntPtr
        Restore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemBackupRestore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemBackupRestore::Backup method backs up the contents of the static repository to a separate file.
     * @param {PWSTR} strBackupToFile Constant, null-terminated string of 16-bit Unicode characters that contains the file name to which to back up the contents of the repository.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestore-backup
     */
    Backup(strBackupToFile, lFlags) {
        strBackupToFile := strBackupToFile is String ? StrPtr(strBackupToFile) : strBackupToFile

        result := ComCall(3, this, "ptr", strBackupToFile, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemBackupRestore::Restore method deletes the contents of the current repository and restores them with the contents of a previously specified backup.
     * @remarks
     * The default mode is the same as setting the force-mode flag, which breaks all active connections. This results in remote procedure call (RPC) errors from  active COM connections to WMI—until new connections are established.
     * @param {PWSTR} strRestoreFromFile Constant, null-terminated string of 16-bit Unicode characters that contains the file name of the file to be restored. The specified file should point to a file previously created with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbembackuprestore-backup">IWbemBackupRestore::Backup</a>.
     * @param {Integer} lFlags One of the following flags from the <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_backup_restore_flags">WBEM_BACKUP_RESTORE_FLAGS</a> enumeration.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within the <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestore-restore
     */
    Restore(strRestoreFromFile, lFlags) {
        strRestoreFromFile := strRestoreFromFile is String ? StrPtr(strRestoreFromFile) : strRestoreFromFile

        result := ComCall(4, this, "ptr", strRestoreFromFile, "int", lFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemBackupRestore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Backup := CallbackCreate(GetMethod(implObj, "Backup"), flags, 3)
        this.vtbl.Restore := CallbackCreate(GetMethod(implObj, "Restore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Backup)
        CallbackFree(this.vtbl.Restore)
    }
}
