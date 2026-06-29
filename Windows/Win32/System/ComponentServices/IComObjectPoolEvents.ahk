#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber when a new object is added to the pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomobjectpoolevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComObjectPoolEvents extends IUnknown {
    /**
     * The interface identifier for IComObjectPoolEvents
     * @type {Guid}
     */
    static IID := Guid("{683130ad-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComObjectPoolEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjPoolPutObject   : IntPtr
        OnObjPoolGetObject   : IntPtr
        OnObjPoolRecycleToTx : IntPtr
        OnObjPoolGetFromTx   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComObjectPoolEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a new object is added to the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} nReason This parameter is always 0.
     * @param {Integer} dwAvailable The number of objects in the pool.
     * @param {Integer} oid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolputobject
     */
    OnObjPoolPutObject(pInfo, guidObject, nReason, dwAvailable, oid) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "int", nReason, "uint", dwAvailable, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when a non-transactional object is obtained from the pool. (IComObjectPoolEvents.OnObjPoolGetObject)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwAvailable The number of objects in the pool.
     * @param {Integer} oid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolgetobject
     */
    OnObjPoolGetObject(pInfo, guidActivity, guidObject, dwAvailable, oid) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, "uint", dwAvailable, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when a transactional object is returned to the pool. (IComObjectPoolEvents.OnObjPoolRecycleToTx)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidTx The GUID representing the transaction identifier.
     * @param {Integer} objid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolrecycletotx
     */
    OnObjPoolRecycleToTx(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, Guid.Ptr, guidTx, "uint", objid, "HRESULT")
        return result
    }

    /**
     * Generated when a transactional object is obtained from the pool. (IComObjectPoolEvents.OnObjPoolGetFromTx)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {Integer} objid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolgetfromtx
     */
    OnObjPoolGetFromTx(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, Guid.Ptr, guidTx, "uint", objid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComObjectPoolEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjPoolPutObject := CallbackCreate(GetMethod(implObj, "OnObjPoolPutObject"), flags, 6)
        this.vtbl.OnObjPoolGetObject := CallbackCreate(GetMethod(implObj, "OnObjPoolGetObject"), flags, 6)
        this.vtbl.OnObjPoolRecycleToTx := CallbackCreate(GetMethod(implObj, "OnObjPoolRecycleToTx"), flags, 6)
        this.vtbl.OnObjPoolGetFromTx := CallbackCreate(GetMethod(implObj, "OnObjPoolGetFromTx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjPoolPutObject)
        CallbackFree(this.vtbl.OnObjPoolGetObject)
        CallbackFree(this.vtbl.OnObjPoolRecycleToTx)
        CallbackFree(this.vtbl.OnObjPoolGetFromTx)
    }
}
