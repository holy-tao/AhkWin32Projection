#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct ISimpleConnectionPoint extends IUnknown {
    /**
     * The interface identifier for ISimpleConnectionPoint
     * @type {Guid}
     */
    static IID := Guid("{51973c3e-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimpleConnectionPoint interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventCount  : IntPtr
        DescribeEvents : IntPtr
        Advise         : IntPtr
        Unadvise       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimpleConnectionPoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEventCount() {
        result := ComCall(3, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * 
     * @param {Integer} iEvent 
     * @param {Integer} cEvents 
     * @param {Pointer<Integer>} prgid 
     * @param {Pointer<BSTR>} prgbstr 
     * @param {Pointer<Integer>} pcEventsFetched 
     * @returns {HRESULT} 
     */
    DescribeEvents(iEvent, cEvents, prgid, prgbstr, pcEventsFetched) {
        prgidMarshal := prgid is VarRef ? "int*" : "ptr"
        pcEventsFetchedMarshal := pcEventsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", iEvent, "uint", cEvents, prgidMarshal, prgid, BSTR.Ptr, prgbstr, pcEventsFetchedMarshal, pcEventsFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @returns {Integer} 
     */
    Advise(pdisp) {
        result := ComCall(5, this, "ptr", pdisp, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISimpleConnectionPoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventCount := CallbackCreate(GetMethod(implObj, "GetEventCount"), flags, 2)
        this.vtbl.DescribeEvents := CallbackCreate(GetMethod(implObj, "DescribeEvents"), flags, 6)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 3)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventCount)
        CallbackFree(this.vtbl.DescribeEvents)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
    }
}
