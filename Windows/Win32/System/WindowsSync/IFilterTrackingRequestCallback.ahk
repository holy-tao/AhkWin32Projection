#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncFilter.ahk" { ISyncFilter }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFilterTrackingRequestCallback extends IUnknown {
    /**
     * The interface identifier for IFilterTrackingRequestCallback
     * @type {Guid}
     */
    static IID := Guid("{713ca7bb-c858-4674-b4b6-1122436587a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterTrackingRequestCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestTrackedFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterTrackingRequestCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISyncFilter} pFilter 
     * @returns {HRESULT} 
     */
    RequestTrackedFilter(pFilter) {
        result := ComCall(3, this, "ptr", pFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterTrackingRequestCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestTrackedFilter := CallbackCreate(GetMethod(implObj, "RequestTrackedFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestTrackedFilter)
    }
}
