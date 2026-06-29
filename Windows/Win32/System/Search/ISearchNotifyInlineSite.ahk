#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SEARCH_INDEXING_PHASE.ahk" { SEARCH_INDEXING_PHASE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SEARCH_ITEM_INDEXING_STATUS.ahk" { SEARCH_ITEM_INDEXING_STATUS }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods the Search service uses to send updates on catalog and index status to notification providers.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchnotifyinlinesite
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchNotifyInlineSite extends IUnknown {
    /**
     * The interface identifier for ISearchNotifyInlineSite
     * @type {Guid}
     */
    static IID := Guid("{b5702e61-e75c-4b64-82a1-6cb4f832fccf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchNotifyInlineSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnItemIndexedStatusChange : IntPtr
        OnCatalogStatusChange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchNotifyInlineSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the search service to notify the client when the status of a particular document or item changes.
     * @param {SEARCH_INDEXING_PHASE} sipStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_indexing_phase">SEARCH_INDEXING_PHASE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_indexing_phase">SEARCH_INDEXING_PHASE</a> status of each document in the array being sent.
     * @param {Integer} dwNumEntries Type: <b>DWORD</b>
     * 
     * The number of entries in <i>rgItemStatusEntries</i>.
     * @param {Pointer<SEARCH_ITEM_INDEXING_STATUS>} rgItemStatusEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_indexing_status">SEARCH_ITEM_INDEXING_STATUS</a>[]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_indexing_status">SEARCH_ITEM_INDEXING_STATUS</a> structures containing status update information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchnotifyinlinesite-onitemindexedstatuschange
     */
    OnItemIndexedStatusChange(sipStatus, dwNumEntries, rgItemStatusEntries) {
        result := ComCall(3, this, SEARCH_INDEXING_PHASE, sipStatus, "uint", dwNumEntries, SEARCH_ITEM_INDEXING_STATUS.Ptr, rgItemStatusEntries, "HRESULT")
        return result
    }

    /**
     * Called by the search service to notify a client when the status of the catalog changes.
     * @remarks
     * When a catalog checkpoint occurs, the search service updates the <i>dwLastCheckPointNumber</i>, and all notifications sent prior to that checkpoint are safe and recoverable in the event of a service failure. Notification providers need to track only those notifications sent between checkpoints and must resend them if the catalog is restored or reset.
     *             
     * 
     * If a catalog restore occurs, the search service rolls back the catalog to the last saved checkpoint and updates the <i>guidCheckPointSignature</i>. In this situation, notification providers must resend all notifications accumulated since the most recent saved checkpoint, as identified by the <i>dwLastCheckPointNumber</i> parameter.
     *             
     * 
     * If a catalog reset occurs, the search service resets the entire catalog and updates the <i>guidCatalogResetSignature</i>. The notification provider must resend its entire crawl scope.
     * @param {Pointer<Guid>} guidCatalogResetSignature Type: <b>REFGUID</b>
     * 
     * A GUID representing the catalog reset. If this GUID changes, all notifications must be resent.
     * @param {Pointer<Guid>} guidCheckPointSignature Type: <b>REFGUID</b>
     * 
     * A GUID representing the last checkpoint restored. If this GUID changes, all notifications accumulated since the last saved checkpoint must be resent.
     * @param {Integer} dwLastCheckPointNumber Type: <b>DWORD</b>
     * 
     * A number indicating the last checkpoint saved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchnotifyinlinesite-oncatalogstatuschange
     */
    OnCatalogStatusChange(guidCatalogResetSignature, guidCheckPointSignature, dwLastCheckPointNumber) {
        result := ComCall(4, this, Guid.Ptr, guidCatalogResetSignature, Guid.Ptr, guidCheckPointSignature, "uint", dwLastCheckPointNumber, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchNotifyInlineSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnItemIndexedStatusChange := CallbackCreate(GetMethod(implObj, "OnItemIndexedStatusChange"), flags, 4)
        this.vtbl.OnCatalogStatusChange := CallbackCreate(GetMethod(implObj, "OnCatalogStatusChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnItemIndexedStatusChange)
        CallbackFree(this.vtbl.OnCatalogStatusChange)
    }
}
