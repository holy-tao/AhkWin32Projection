#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWbemBackupRestore.ahk" { IWbemBackupRestore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWbemBackupRestoreEx interface backs up and restores the contents of the repository.
 * @remarks
 * The default mode is the same as setting the force mode flag, which breaks all active connections. This results in remote procedure call (RPC) errors from any active COM connections to WMI until new connections are established.
 * 
 * There can be no active connections to the repository during a restore operation. For this reason, the restore operation fails if default parameters are used and there are active connections. A flag can be specified to break all active connections.
 * 
 * The client making the call must have the correct privilege enabled. Backup requires the <b>SE_RESTORE_NAME</b> privilege, and restoration requires <b>SE_RESTORE_NAME</b>. To enable a privilege, a client application must be running under a user account that has that privilege, and the privilege must be enabled using the Windows <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> function.
 * 
 * Any local user can make these calls, but remote users must have the <b>WBEM_FULL_WRITE_REP</b> access right to the root namespace.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbembackuprestoreex
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemBackupRestoreEx extends IWbemBackupRestore {
    /**
     * The interface identifier for IWbemBackupRestoreEx
     * @type {Guid}
     */
    static IID := Guid("{a359dec5-e813-4834-8a2a-ba7f1d777d76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemBackupRestoreEx interfaces
    */
    struct Vtbl extends IWbemBackupRestore.Vtbl {
        Pause  : IntPtr
        Resume : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemBackupRestoreEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemBackupRestoreEx::Pause method locks out write operations from the Windows Management Instrumentation (WMI) repository, and may cause read operations to be blocked.
     * @remarks
     * When implementing the <b>Pause</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-resume">Resume</a> method should be called as soon as possible. If <b>Resume</b> is not called within fifteen (15) minutes, it is called automatically for you. Calling <b>Pause</b> two times on the same object without calling <b>Resume</b> first will fail. Calling <b>Pause</b> on two objects at the same time may cause the second object to lock up until <b>Resume</b> is called on the first object.
     * 
     * <div class="alert"><b>Note</b>  To implement the <b>Pause</b> method, the client user must have <b>SE_BACKUP_NAME</b> prior to calling the method.</div>
     * <div> </div>
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of a method call. The following list lists the values contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IWbemBackUpRestoreEx::Resume method releases a lock on the Windows Management Instrumentation (WMI) repository so operations can continue.
     * @remarks
     * The <b>Resume</b> method should always be called when the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-pause">Pause</a> method is called. <b>Resume</b> must be called on the same instance of <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbembackuprestoreex">IWbemBackUpRestoreEx</a> that the <b>Pause</b> method is implemented. Releasing the object without calling <b>Resume</b> automatically causes the <b>Resume</b> method to be implemented.
     * 
     * <div class="alert"><b>Note</b>  To implement the <b>Resume</b> method, the client user must have <b>SE_BACKUP_NAME</b> prior to calling the method.</div>
     * <div> </div>
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of a method call. The following list lists the values contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbembackuprestoreex-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemBackupRestoreEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
    }
}
