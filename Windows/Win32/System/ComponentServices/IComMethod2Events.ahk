#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if an object's method has been called, returned, or generated an exception. (IComMethod2Events)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icommethod2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComMethod2Events extends IUnknown {
    /**
     * The interface identifier for IComMethod2Events
     * @type {Guid}
     */
    static IID := Guid("{fb388aaa-567d-4024-af8e-6e93ee748573}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComMethod2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMethodCall2      : IntPtr
        OnMethodReturn2    : IntPtr
        OnMethodException2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComMethod2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object's method is called. (IComMethod2Events.OnMethodCall2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method being called.
     * @param {Integer} dwThread The identifier of the thread executing the call.
     * @param {Integer} iMeth The v-table index of the method.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodcall2
     */
    OnMethodCall2(pInfo, oid, guidCid, guidRid, dwThread, iMeth) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", dwThread, "uint", iMeth, "HRESULT")
        return result
    }

    /**
     * Generated when an object's method returns. (IComMethod2Events.OnMethodReturn2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method being called.
     * @param {Integer} dwThread The identifier of the thread executing the call.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {HRESULT} _hresult The result of the method call.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodreturn2
     */
    OnMethodReturn2(pInfo, oid, guidCid, guidRid, dwThread, iMeth, _hresult) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", dwThread, "uint", iMeth, "int", _hresult, "HRESULT")
        return result
    }

    /**
     * Generated when an object's method generates an exception. (IComMethod2Events.OnMethodException2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} oid The just-in-time (JIT) activated object.
     * @param {Pointer<Guid>} guidCid The CLSID for the object being called.
     * @param {Pointer<Guid>} guidRid The identifier of the method being called.
     * @param {Integer} dwThread The identifier of the thread executing the call.
     * @param {Integer} iMeth The v-table index of the method.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodexception2
     */
    OnMethodException2(pInfo, oid, guidCid, guidRid, dwThread, iMeth) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", oid, Guid.Ptr, guidCid, Guid.Ptr, guidRid, "uint", dwThread, "uint", iMeth, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComMethod2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMethodCall2 := CallbackCreate(GetMethod(implObj, "OnMethodCall2"), flags, 7)
        this.vtbl.OnMethodReturn2 := CallbackCreate(GetMethod(implObj, "OnMethodReturn2"), flags, 8)
        this.vtbl.OnMethodException2 := CallbackCreate(GetMethod(implObj, "OnMethodException2"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMethodCall2)
        CallbackFree(this.vtbl.OnMethodReturn2)
        CallbackFree(this.vtbl.OnMethodException2)
    }
}
