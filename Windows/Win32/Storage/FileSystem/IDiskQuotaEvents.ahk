#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDiskQuotaUser.ahk" { IDiskQuotaUser }

/**
 * Receives quota-related event notifications.
 * @see https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotaevents
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IDiskQuotaEvents extends IUnknown {
    /**
     * The interface identifier for IDiskQuotaEvents
     * @type {Guid}
     */
    static IID := Guid("{7988b579-ec89-11cf-9c00-00aa00a14f56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiskQuotaEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUserNameChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiskQuotaEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the client's connection sink whenever a user's SID has been asynchronously resolved.
     * @param {IDiskQuotaUser} pUser A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface for the quota user object. Do not  call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on this pointer. The <b>DiskQuotaControl</b> object controls the lifetime of the user object.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotaevents-onusernamechanged
     */
    OnUserNameChanged(pUser) {
        result := ComCall(3, this, "ptr", pUser, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiskQuotaEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUserNameChanged := CallbackCreate(GetMethod(implObj, "OnUserNameChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUserNameChanged)
    }
}
