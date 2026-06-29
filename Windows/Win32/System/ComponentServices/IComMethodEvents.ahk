#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if an object's method has been called, returned, or generated an exception. (IComMethodEvents)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icommethodevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComMethodEvents extends IUnknown {
    /**
     * The interface identifier for IComMethodEvents
     * @type {Guid}
     */
    static IID := Guid("{683130a9-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComMethodEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMethodCall      : IntPtr
        OnMethodReturn    : IntPtr
        OnMethodException : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComMethodEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object's method is called. (IComMethodEvents.OnMethodCall)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method being called.
     * @param {Integer} iMeth The v-table index of the method.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodcall
     */
    OnMethodCall(pInfo, oid, guidCid, guidRid, iMeth) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", iMeth, "HRESULT")
        return result
    }

    /**
     * Generated when an object's method returns. (IComMethodEvents.OnMethodReturn)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {HRESULT} _hresult The result of the method call.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodreturn
     */
    OnMethodReturn(pInfo, oid, guidCid, guidRid, iMeth, _hresult) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", iMeth, "int", _hresult, "HRESULT")
        return result
    }

    /**
     * Generated when an object's method generates an exception. (IComMethodEvents.OnMethodException)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodexception
     */
    OnMethodException(pInfo, oid, guidCid, guidRid, iMeth) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", iMeth, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComMethodEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMethodCall := CallbackCreate(GetMethod(implObj, "OnMethodCall"), flags, 6)
        this.vtbl.OnMethodReturn := CallbackCreate(GetMethod(implObj, "OnMethodReturn"), flags, 7)
        this.vtbl.OnMethodException := CallbackCreate(GetMethod(implObj, "OnMethodException"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMethodCall)
        CallbackFree(this.vtbl.OnMethodReturn)
        CallbackFree(this.vtbl.OnMethodException)
    }
}
