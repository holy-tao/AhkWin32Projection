#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRSyncManager extends IUnknown{
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
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<IHostTask>} ppOwnerHostTask 
     * @returns {HRESULT} 
     */
    GetMonitorOwner(Cookie, ppOwnerHostTask) {
        result := ComCall(3, this, "ptr", Cookie, "ptr", ppOwnerHostTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<UIntPtr>} pIterator 
     * @returns {HRESULT} 
     */
    CreateRWLockOwnerIterator(Cookie, pIterator) {
        result := ComCall(4, this, "ptr", Cookie, "ptr*", pIterator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @param {Pointer<IHostTask>} ppOwnerHostTask 
     * @returns {HRESULT} 
     */
    GetRWLockOwnerNext(Iterator, ppOwnerHostTask) {
        result := ComCall(5, this, "ptr", Iterator, "ptr", ppOwnerHostTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} Iterator 
     * @returns {HRESULT} 
     */
    DeleteRWLockOwnerIterator(Iterator) {
        result := ComCall(6, this, "ptr", Iterator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
