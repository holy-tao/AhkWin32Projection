#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber when a new object is created for or removed from the pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomobjectpoolevents2
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComObjectPoolEvents2 extends IUnknown {
    /**
     * The interface identifier for IComObjectPoolEvents2
     * @type {Guid}
     */
    static IID := Guid("{683130ae-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComObjectPoolEvents2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjPoolCreateObject   : IntPtr
        OnObjPoolDestroyObject  : IntPtr
        OnObjPoolCreateDecision : IntPtr
        OnObjPoolTimeout        : IntPtr
        OnObjPoolCreatePool     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComObjectPoolEvents2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object is created for the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwObjsCreated The number of objects in the pool.
     * @param {Integer} oid The unique pooled object identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreateobject
     */
    OnObjPoolCreateObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when an object is permanently removed from the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwObjsCreated The number of objects in the pool.
     * @param {Integer} oid The unique pooled object identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooldestroyobject
     */
    OnObjPoolDestroyObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when a pool provides a requesting client with an existing object or creates a new one.
     * @remarks
     * When a component is configured for object pooling, the pool is populated with objects up to the specified minimum level. As client requests for the component come in, they are satisfied on a first-come first-served basis from the pool. If no pooled objects are available and the pool is not yet at its specified maximum level, a new object is created and activated for the client.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} dwThreadsWaiting The number of threads waiting for an object.
     * @param {Integer} dwAvail The number of free objects in the pool.
     * @param {Integer} dwCreated The number of total objects in the pool.
     * @param {Integer} dwMin The pool's minimum object value.
     * @param {Integer} dwMax The pool's maximum object value.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatedecision
     */
    OnObjPoolCreateDecision(pInfo, dwThreadsWaiting, dwAvail, dwCreated, dwMin, dwMax) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", dwThreadsWaiting, "uint", dwAvail, "uint", dwCreated, "uint", dwMin, "uint", dwMax, "HRESULT")
        return result
    }

    /**
     * Generated when the request for a pooled object times out.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} dwTimeout The pool's time-out value.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooltimeout
     */
    OnObjPoolTimeout(pInfo, guidObject, guidActivity, dwTimeout) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, Guid.Ptr, guidActivity, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * Generated when a new pool is created.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwMin The pool's minimum object value.
     * @param {Integer} dwMax The pool's maximum object value.
     * @param {Integer} dwTimeout The pool's time-out value.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatepool
     */
    OnObjPoolCreatePool(pInfo, guidObject, dwMin, dwMax, dwTimeout) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "uint", dwMin, "uint", dwMax, "uint", dwTimeout, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComObjectPoolEvents2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjPoolCreateObject := CallbackCreate(GetMethod(implObj, "OnObjPoolCreateObject"), flags, 5)
        this.vtbl.OnObjPoolDestroyObject := CallbackCreate(GetMethod(implObj, "OnObjPoolDestroyObject"), flags, 5)
        this.vtbl.OnObjPoolCreateDecision := CallbackCreate(GetMethod(implObj, "OnObjPoolCreateDecision"), flags, 7)
        this.vtbl.OnObjPoolTimeout := CallbackCreate(GetMethod(implObj, "OnObjPoolTimeout"), flags, 5)
        this.vtbl.OnObjPoolCreatePool := CallbackCreate(GetMethod(implObj, "OnObjPoolCreatePool"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjPoolCreateObject)
        CallbackFree(this.vtbl.OnObjPoolDestroyObject)
        CallbackFree(this.vtbl.OnObjPoolCreateDecision)
        CallbackFree(this.vtbl.OnObjPoolTimeout)
        CallbackFree(this.vtbl.OnObjPoolCreatePool)
    }
}
