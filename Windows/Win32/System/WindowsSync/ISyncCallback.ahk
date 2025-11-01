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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnProgress", "OnChange", "OnConflict", "OnFullEnumerationNeeded", "OnRecoverableError"]

    /**
     * 
     * @param {Integer} provider 
     * @param {Integer} syncStage 
     * @param {Integer} dwCompletedWork 
     * @param {Integer} dwTotalWork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(3, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChange} pSyncChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onchange
     */
    OnChange(pSyncChange) {
        result := ComCall(4, this, "ptr", pSyncChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IChangeConflict} pConflict 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onconflict
     */
    OnConflict(pConflict) {
        result := ComCall(5, this, "ptr", pConflict, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFullEnumerationAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onfullenumerationneeded
     */
    OnFullEnumerationNeeded(pFullEnumerationAction) {
        result := ComCall(6, this, "int*", pFullEnumerationAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRecoverableError} pRecoverableError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onrecoverableerror
     */
    OnRecoverableError(pRecoverableError) {
        result := ComCall(7, this, "ptr", pRecoverableError, "HRESULT")
        return result
    }
}
