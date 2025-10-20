#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a transactional or non-transactional object is added to or obtained from the object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectpool2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectPool2Events extends IUnknown{
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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} nReason 
     * @param {Integer} dwAvailable 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     */
    OnObjPoolPutObject2(pInfo, guidObject, nReason, dwAvailable, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "int", nReason, "uint", dwAvailable, "uint", oid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwAvailable 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidPartition 
     * @returns {HRESULT} 
     */
    OnObjPoolGetObject2(pInfo, guidActivity, guidObject, dwAvailable, oid, guidPartition) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "uint", dwAvailable, "uint", oid, "ptr", guidPartition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} guidObject 
     * @param {Pointer<Guid>} guidTx 
     * @param {Integer} objid 
     * @returns {HRESULT} 
     */
    OnObjPoolRecycleToTx2(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} guidObject 
     * @param {Pointer<Guid>} guidTx 
     * @param {Integer} objid 
     * @param {Pointer<Guid>} guidPartition 
     * @returns {HRESULT} 
     */
    OnObjPoolGetFromTx2(pInfo, guidActivity, guidObject, guidTx, objid, guidPartition) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "ptr", guidPartition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
