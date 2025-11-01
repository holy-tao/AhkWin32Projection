#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber when a new object is added to the pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectpoolevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectPoolEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComObjectPoolEvents
     * @type {Guid}
     */
    static IID => Guid("{683130ad-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjPoolPutObject", "OnObjPoolGetObject", "OnObjPoolRecycleToTx", "OnObjPoolGetFromTx"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} nReason 
     * @param {Integer} dwAvailable 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolputobject
     */
    OnObjPoolPutObject(pInfo, guidObject, nReason, dwAvailable, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "int", nReason, "uint", dwAvailable, "uint", oid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwAvailable 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolgetobject
     */
    OnObjPoolGetObject(pInfo, guidActivity, guidObject, dwAvailable, oid) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "uint", dwAvailable, "uint", oid, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolrecycletotx
     */
    OnObjPoolRecycleToTx(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents-onobjpoolgetfromtx
     */
    OnObjPoolGetFromTx(pInfo, guidActivity, guidObject, guidTx, objid) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidActivity, "ptr", guidObject, "ptr", guidTx, "uint", objid, "HRESULT")
        return result
    }
}
