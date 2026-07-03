#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMLatency interface reports the amount of latency that a filter introduces into the graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamlatency
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMLatency extends IUnknown {
    /**
     * The interface identifier for IAMLatency
     * @type {Guid}
     */
    static IID := Guid("{62ea93ba-ec62-11d2-b770-00c04fb6bd3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMLatency interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLatency : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMLatency.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetLatency method retrieves the expected latency associated with this filter.
     * @returns {Integer} Pointer to a variable that receives the latency in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamlatency-getlatency
     */
    GetLatency() {
        result := ComCall(3, this, "int64*", &prtLatency := 0, "HRESULT")
        return prtLatency
    }

    Query(iid) {
        if (IAMLatency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLatency := CallbackCreate(GetMethod(implObj, "GetLatency"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLatency)
    }
}
