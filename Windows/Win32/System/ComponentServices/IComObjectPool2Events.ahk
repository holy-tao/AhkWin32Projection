#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a transactional or non-transactional object is added to or obtained from the object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomobjectpool2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComObjectPool2Events extends IUnknown {
    /**
     * The interface identifier for IComObjectPool2Events
     * @type {Guid}
     */
    static IID := Guid("{65bf6534-85ea-4f64-8cf4-3d974b2ab1cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComObjectPool2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjPoolPutObject2   : IntPtr
        OnObjPoolGetObject2   : IntPtr
        OnObjPoolRecycleToTx2 : IntPtr
        OnObjPoolGetFromTx2   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComObjectPool2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object is added to the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} nReason This parameter is reserved.
     * @param {Integer} dwAvailable The number of objects in the pool.
     * @param {Integer} oid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolputobject2
     */
    OnObjPoolPutObject2(pInfo, guidObject, nReason, dwAvailable, oid) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "int", nReason, "uint", dwAvailable, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when a non-transactional object is obtained from the pool. (IComObjectPool2Events.OnObjPoolGetObject2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwAvailable The number of objects in the pool.
     * @param {Integer} oid The unique identifier for this object.
     * @param {Pointer<Guid>} guidPartition The partition identifier for this instance.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolgetobject2
     */
    OnObjPoolGetObject2(pInfo, guidActivity, guidObject, dwAvailable, oid, guidPartition) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, "uint", dwAvailable, "uint", oid, Guid.Ptr, guidPartition, "HRESULT")
        return result
    }

    /**
     * Generated when a transactional object is returned to the pool. (IComObjectPool2Events.OnObjPoolRecycleToTx2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidTx The transaction identifier.
     * @param {Integer} objid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolrecycletotx2
     */
    OnObjPoolRecycleToTx2(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, Guid.Ptr, guidTx, "uint", objid, "HRESULT")
        return result
    }

    /**
     * Generated when a transactional object is obtained from the pool. (IComObjectPool2Events.OnObjPoolGetFromTx2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The activity ID for which the object is created.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidTx The GUID representing the transaction identifier.
     * @param {Integer} objid The unique identifier for this object.
     * @param {Pointer<Guid>} guidPartition The partition identifier for this instance.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolgetfromtx2
     */
    OnObjPoolGetFromTx2(pInfo, guidActivity, guidObject, guidTx, objid, guidPartition) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, guidObject, Guid.Ptr, guidTx, "uint", objid, Guid.Ptr, guidPartition, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComObjectPool2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjPoolPutObject2 := CallbackCreate(GetMethod(implObj, "OnObjPoolPutObject2"), flags, 6)
        this.vtbl.OnObjPoolGetObject2 := CallbackCreate(GetMethod(implObj, "OnObjPoolGetObject2"), flags, 7)
        this.vtbl.OnObjPoolRecycleToTx2 := CallbackCreate(GetMethod(implObj, "OnObjPoolRecycleToTx2"), flags, 6)
        this.vtbl.OnObjPoolGetFromTx2 := CallbackCreate(GetMethod(implObj, "OnObjPoolGetFromTx2"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjPoolPutObject2)
        CallbackFree(this.vtbl.OnObjPoolGetObject2)
        CallbackFree(this.vtbl.OnObjPoolRecycleToTx2)
        CallbackFree(this.vtbl.OnObjPoolGetFromTx2)
    }
}
