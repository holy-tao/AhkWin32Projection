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
     * Generated when an object is created for the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwObjsCreated The number of objects in the pool.
     * @param {Integer} oid The unique pooled object identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreateobject
     */
    OnObjPoolCreateObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when an object is permanently removed from the pool.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Integer} dwObjsCreated The number of objects in the pool.
     * @param {Integer} oid The unique pooled object identifier.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooldestroyobject
     */
    OnObjPoolDestroyObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "HRESULT")
        return result
    }

    /**
     * Generated when a pool provides a requesting client with an existing object or creates a new one.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} dwThreadsWaiting The number of threads waiting for an object.
     * @param {Integer} dwAvail The number of free objects in the pool.
     * @param {Integer} dwCreated The number of total objects in the pool.
     * @param {Integer} dwMin The pool's minimum object value.
     * @param {Integer} dwMax The pool's maximum object value.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatedecision
     */
    OnObjPoolCreateDecision(pInfo, dwThreadsWaiting, dwAvail, dwCreated, dwMin, dwMax) {
        result := ComCall(5, this, "ptr", pInfo, "uint", dwThreadsWaiting, "uint", dwAvail, "uint", dwCreated, "uint", dwMin, "uint", dwMax, "HRESULT")
        return result
    }

    /**
     * Generated when the request for a pooled object times out.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} dwTimeout The pool's time-out value.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpooltimeout
     */
    OnObjPoolTimeout(pInfo, guidObject, guidActivity, dwTimeout) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidObject, "ptr", guidActivity, "uint", dwTimeout, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomobjectpoolevents2-onobjpoolcreatepool
     */
    OnObjPoolCreatePool(pInfo, guidObject, dwMin, dwMax, dwTimeout) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidObject, "uint", dwMin, "uint", dwMax, "uint", dwTimeout, "HRESULT")
        return result
    }
}
