#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITDispatchMapper interface allows an application to retrieve the dispatch pointer of another interface on an object, given the dispatch pointer of one interface and the GUID of another.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itdispatchmapper
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDispatchMapper extends IDispatch {
    /**
     * The interface identifier for ITDispatchMapper
     * @type {Guid}
     */
    static IID := Guid("{e9225295-c759-11d1-a02b-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDispatchMapper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        QueryDispatchInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDispatchMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryDispatchInterface method returns a dispatch pointer to a different interface on an object given its GUID and the dispatch pointer of another interface on the object.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pIID</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * The Dispatch Mapper will use the object's <b>IObjectSafety</b> interface to make sure the object is safe for scripting on the requested interface. If the object does not implement <b>IObjectSafety</b>, or if the object is not safe on this particular interface, the call will fail.
     * @param {BSTR} pIID Pointer to <b>BSTR</b> representation of GUID for needed interface.
     * @param {IDispatch} pInterfaceToMap <b>IDispatch</b> pointer of starting interface.
     * @returns {IDispatch} <b>IDispatch</b> pointer of interface corresponding the GUID contained in <i>pIID</i>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdispatchmapper-querydispatchinterface
     */
    QueryDispatchInterface(pIID, pInterfaceToMap) {
        pIID := pIID is String ? BSTR.Alloc(pIID).Value : pIID

        result := ComCall(7, this, BSTR, pIID, "ptr", pInterfaceToMap, "ptr*", &ppReturnedInterface := 0, "HRESULT")
        return IDispatch(ppReturnedInterface)
    }

    Query(iid) {
        if (ITDispatchMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryDispatchInterface := CallbackCreate(GetMethod(implObj, "QueryDispatchInterface"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryDispatchInterface)
    }
}
