#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Suspends or releases a share root or directory tree in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessuspend
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSuspend extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesSuspend
     * @type {Guid}
     */
    static IID := Guid("{62c4560f-bc0b-48ca-ad9d-34cb528d99a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSuspend interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SuspendRoot : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSuspend.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Suspend or release a share root or directory tree.
     * @remarks
     * When a share root or directory tree is suspended, all directories and files contained in the share or directory or in any subfolders are suspended as well.  This means that both directories and files may be suspended. Note that a directory can be suspended directly (if it is the root of the share or directory tree) or indirectly (if it is one of the items contained in the share or directory tree).
     * @param {BOOL} bSuspend Specify <b>TRUE</b> to suspend, or <b>FALSE</b> to release.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessuspend-suspendroot
     */
    SuspendRoot(bSuspend) {
        result := ComCall(3, this, BOOL, bSuspend, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesSuspend.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SuspendRoot := CallbackCreate(GetMethod(implObj, "SuspendRoot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SuspendRoot)
    }
}
