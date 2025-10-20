#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRSyncManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRSyncManager
     * @type {Guid}
     */
    static IID => Guid("{55ff199d-ad21-48f9-a16c-f24ebbb8727d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMonitorOwner", "CreateRWLockOwnerIterator", "GetRWLockOwnerNext", "DeleteRWLockOwnerIterator"]

    /**
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<IHostTask>} ppOwnerHostTask 
     * @returns {HRESULT} 
     */
    GetMonitorOwner(Cookie, ppOwnerHostTask) {
        result := ComCall(3, this, "ptr", Cookie, "ptr*", ppOwnerHostTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<Pointer>} pIterator 
     * @returns {HRESULT} 
     */
    CreateRWLockOwnerIterator(Cookie, pIterator) {
        result := ComCall(4, this, "ptr", Cookie, "ptr*", pIterator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @param {Pointer<IHostTask>} ppOwnerHostTask 
     * @returns {HRESULT} 
     */
    GetRWLockOwnerNext(Iterator, ppOwnerHostTask) {
        result := ComCall(5, this, "ptr", Iterator, "ptr*", ppOwnerHostTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @returns {HRESULT} 
     */
    DeleteRWLockOwnerIterator(Iterator) {
        result := ComCall(6, this, "ptr", Iterator, "HRESULT")
        return result
    }
}
