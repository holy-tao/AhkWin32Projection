#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a transactional or non-transactional object is added to or obtained from the object pool.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-icomobjectpool2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectPool2Events extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComObjectPool2Events
     * @type {Guid}
     */
    static IID => Guid("{65bf6534-85ea-4f64-8cf4-3d974b2ab1cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjPoolPutObject2", "OnObjPoolGetObject2", "OnObjPoolRecycleToTx2", "OnObjPoolGetFromTx2"]

    /**
     * Generated when an object is added to the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} nReason This parameter is reserved.
     * @param {Integer} dwAvailable The number of objects in the pool.
     * @param {Integer} oid The unique identifier for this object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolputobject2
     */
    OnObjPoolPutObject2(pInfo, guidObject, nReason, dwAvailable, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "int", nReason, "uint", dwAvailable, "uint", oid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolgetobject2
     */
    OnObjPoolGetObject2(pInfo, guidActivity, guidObject, dwAvailable, oid, guidPartition) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "uint", dwAvailable, "uint", oid, "ptr", guidPartition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolrecycletotx2
     */
    OnObjPoolRecycleToTx2(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icomobjectpool2events-onobjpoolgetfromtx2
     */
    OnObjPoolGetFromTx2(pInfo, guidActivity, guidObject, guidTx, objid, guidPartition) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "ptr", guidPartition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
