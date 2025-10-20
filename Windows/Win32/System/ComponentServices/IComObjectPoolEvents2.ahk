#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber when a new object is created for or removed from the pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectpoolevents2
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectPoolEvents2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComObjectPoolEvents2
     * @type {Guid}
     */
    static IID => Guid("{683130ae-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjPoolCreateObject", "OnObjPoolDestroyObject", "OnObjPoolCreateDecision", "OnObjPoolTimeout", "OnObjPoolCreatePool"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwObjsCreated 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreateobject
     */
    OnObjPoolCreateObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwObjsCreated 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooldestroyobject
     */
    OnObjPoolDestroyObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} dwThreadsWaiting 
     * @param {Integer} dwAvail 
     * @param {Integer} dwCreated 
     * @param {Integer} dwMin 
     * @param {Integer} dwMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatedecision
     */
    OnObjPoolCreateDecision(pInfo, dwThreadsWaiting, dwAvail, dwCreated, dwMin, dwMax) {
        result := ComCall(5, this, "ptr", pInfo, "uint", dwThreadsWaiting, "uint", dwAvail, "uint", dwCreated, "uint", dwMin, "uint", dwMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooltimeout
     */
    OnObjPoolTimeout(pInfo, guidObject, guidActivity, dwTimeout) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidObject, "ptr", guidActivity, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwMin 
     * @param {Integer} dwMax 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatepool
     */
    OnObjPoolCreatePool(pInfo, guidObject, dwMin, dwMax, dwTimeout) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidObject, "uint", dwMin, "uint", dwMax, "uint", dwTimeout, "HRESULT")
        return result
    }
}
