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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwObjsCreated 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     */
    OnObjPoolCreateObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Integer} dwObjsCreated 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     */
    OnObjPoolDestroyObject(pInfo, guidObject, dwObjsCreated, oid) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidObject, "uint", dwObjsCreated, "uint", oid, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OnObjPoolCreateDecision(pInfo, dwThreadsWaiting, dwAvail, dwCreated, dwMin, dwMax) {
        result := ComCall(5, this, "ptr", pInfo, "uint", dwThreadsWaiting, "uint", dwAvail, "uint", dwCreated, "uint", dwMin, "uint", dwMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     */
    OnObjPoolTimeout(pInfo, guidObject, guidActivity, dwTimeout) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidObject, "ptr", guidActivity, "uint", dwTimeout, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OnObjPoolCreatePool(pInfo, guidObject, dwMin, dwMax, dwTimeout) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidObject, "uint", dwMin, "uint", dwMax, "uint", dwTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
