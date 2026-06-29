#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFilterTrackingRequestCallback.ahk" { IFilterTrackingRequestCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncFilter.ahk" { ISyncFilter }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFilterTrackingProvider extends IUnknown {
    /**
     * The interface identifier for IFilterTrackingProvider
     * @type {Guid}
     */
    static IID := Guid("{743383c0-fc4e-45ba-ad81-d9d84c7a24f8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterTrackingProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SpecifyTrackedFilters : IntPtr
        AddTrackedFilter      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterTrackingProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IFilterTrackingRequestCallback} pCallback 
     * @returns {HRESULT} 
     */
    SpecifyTrackedFilters(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncFilter} pFilter 
     * @returns {HRESULT} 
     */
    AddTrackedFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterTrackingProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SpecifyTrackedFilters := CallbackCreate(GetMethod(implObj, "SpecifyTrackedFilters"), flags, 2)
        this.vtbl.AddTrackedFilter := CallbackCreate(GetMethod(implObj, "AddTrackedFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SpecifyTrackedFilters)
        CallbackFree(this.vtbl.AddTrackedFilter)
    }
}
