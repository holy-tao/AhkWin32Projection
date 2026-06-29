#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Determines whether an item is suspended or not and, if so, if it is a suspended root or not.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessuspendinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSuspendInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesSuspendInfo
     * @type {Guid}
     */
    static IID := Guid("{a457c25b-4e9c-4b04-85af-8932ccd97889}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSuspendInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsSuspended : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSuspendInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether an item is suspended.
     * @param {Pointer<BOOL>} pbSuspended Receives <b>TRUE</b> if the item is suspended, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbSuspendedRoot Receives <b>TRUE</b> if the item is a suspended root, or <b>FALSE</b> otherwise.  If the item is not suspended, this value is always <b>FALSE</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessuspendinfo-issuspended
     */
    IsSuspended(pbSuspended, pbSuspendedRoot) {
        pbSuspendedMarshal := pbSuspended is VarRef ? "int*" : "ptr"
        pbSuspendedRootMarshal := pbSuspendedRoot is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pbSuspendedMarshal, pbSuspended, pbSuspendedRootMarshal, pbSuspendedRoot, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesSuspendInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsSuspended := CallbackCreate(GetMethod(implObj, "IsSuspended"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsSuspended)
    }
}
