#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if an instance of a just-in-time (JIT) activated object has been created or freed.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomobjectevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComObjectEvents extends IUnknown {
    /**
     * The interface identifier for IComObjectEvents
     * @type {Guid}
     */
    static IID := Guid("{683130aa-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComObjectEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjectActivate   : IntPtr
        OnObjectDeactivate : IntPtr
        OnDisableCommit    : IntPtr
        OnEnableCommit     : IntPtr
        OnSetComplete      : IntPtr
        OnSetAbort         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComObjectEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object gets an instance of a new JIT-activated object.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The GUID of the current context.
     * @param {Integer} _ObjectID The JIT-activated object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onobjectactivate
     */
    OnObjectActivate(pInfo, CtxtID, _ObjectID) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "uint", _ObjectID, "HRESULT")
        return result
    }

    /**
     * Generated when the JIT-activated object is freed by SetComplete or SetAbort.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The GUID of the current context.
     * @param {Integer} _ObjectID The JIT-activated object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onobjectdeactivate
     */
    OnObjectDeactivate(pInfo, CtxtID, _ObjectID) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "uint", _ObjectID, "HRESULT")
        return result
    }

    /**
     * Generated when the client calls DisableCommit on a context.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The GUID of the current context.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-ondisablecommit
     */
    OnDisableCommit(pInfo, CtxtID) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * Generated when the client calls EnableCommit on a context.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The GUID of the current context.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onenablecommit
     */
    OnEnableCommit(pInfo, CtxtID) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * Generated when the client calls SetComplete on a context.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The GUID of the current context.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onsetcomplete
     */
    OnSetComplete(pInfo, CtxtID) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     */
    OnSetAbort(pInfo, CtxtID) {
        result := ComCall(8, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComObjectEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjectActivate := CallbackCreate(GetMethod(implObj, "OnObjectActivate"), flags, 4)
        this.vtbl.OnObjectDeactivate := CallbackCreate(GetMethod(implObj, "OnObjectDeactivate"), flags, 4)
        this.vtbl.OnDisableCommit := CallbackCreate(GetMethod(implObj, "OnDisableCommit"), flags, 3)
        this.vtbl.OnEnableCommit := CallbackCreate(GetMethod(implObj, "OnEnableCommit"), flags, 3)
        this.vtbl.OnSetComplete := CallbackCreate(GetMethod(implObj, "OnSetComplete"), flags, 3)
        this.vtbl.OnSetAbort := CallbackCreate(GetMethod(implObj, "OnSetAbort"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjectActivate)
        CallbackFree(this.vtbl.OnObjectDeactivate)
        CallbackFree(this.vtbl.OnDisableCommit)
        CallbackFree(this.vtbl.OnEnableCommit)
        CallbackFree(this.vtbl.OnSetComplete)
        CallbackFree(this.vtbl.OnSetAbort)
    }
}
