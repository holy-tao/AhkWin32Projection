#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents application callbacks that are used to notify the application of synchronization events.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isynccallback
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncCallback extends IUnknown{
    /**
     * The interface identifier for ISyncCallback
     * @type {Guid}
     */
    static IID => Guid("{0599797f-5ed9-485c-ae36-0c5d1bf2e7a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} provider 
     * @param {Integer} syncStage 
     * @param {Integer} dwCompletedWork 
     * @param {Integer} dwTotalWork 
     * @returns {HRESULT} 
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(3, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} pSyncChange 
     * @returns {HRESULT} 
     */
    OnChange(pSyncChange) {
        result := ComCall(4, this, "ptr", pSyncChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IChangeConflict>} pConflict 
     * @returns {HRESULT} 
     */
    OnConflict(pConflict) {
        result := ComCall(5, this, "ptr", pConflict, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFullEnumerationAction 
     * @returns {HRESULT} 
     */
    OnFullEnumerationNeeded(pFullEnumerationAction) {
        result := ComCall(6, this, "int*", pFullEnumerationAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRecoverableError>} pRecoverableError 
     * @returns {HRESULT} 
     */
    OnRecoverableError(pRecoverableError) {
        result := ComCall(7, this, "ptr", pRecoverableError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
