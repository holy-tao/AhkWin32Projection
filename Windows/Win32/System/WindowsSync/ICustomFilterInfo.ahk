#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncFilterInfo.ahk" { ISyncFilterInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncFilter.ahk" { ISyncFilter }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ICustomFilterInfo extends ISyncFilterInfo {
    /**
     * The interface identifier for ICustomFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{1d335dff-6f88-4e4d-91a8-a3f351cfd473}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICustomFilterInfo interfaces
    */
    struct Vtbl extends ISyncFilterInfo.Vtbl {
        GetSyncFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICustomFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISyncFilter} 
     */
    GetSyncFilter() {
        result := ComCall(4, this, "ptr*", &pISyncFilter := 0, "HRESULT")
        return ISyncFilter(pISyncFilter)
    }

    Query(iid) {
        if (ICustomFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncFilter := CallbackCreate(GetMethod(implObj, "GetSyncFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncFilter)
    }
}
