#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a synchronization process to report progress and events to Sync Center, or to query whether the process has been canceled.
 * @remarks
 * 
 * This interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession">ISyncMgrSessionCreator::CreateSession</a>, which in turn is referenced in the call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">ISyncMgrHandler::Synchronize</a>.
 * 
 * The handler is expected to call this interface to update the folder's progress UI  for each item and to notify Sync Center when it has completed the synchronization of each item.
 * 
 * <b>ISyncMgrSyncCallback</b> is a replacement for <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsynccallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSyncCallback
     * @type {Guid}
     */
    static IID => Guid("{884ccd87-b139-4937-a4ba-4f8e19513fbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportProgress", "SetHandlerProgressText", "ReportEvent", "CanContinue", "QueryForAdditionalItems", "AddItemToSession", "AddIUnknownToSession", "ProposeItem", "CommitItem", "ReportManualSync"]

    /**
     * Reports the progress of the synchronization of a single sync item to Sync Center.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item currently being synchronized. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszProgressText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing a Unicode string for any custom progress messaging for this item.
     * @param {Integer} nStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a> enumeration stating the current progress status of the synchronization.
     * @param {Integer} uCurrentStep Type: <b>ULONG</b>
     * 
     * The current step in the synchronization. If the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_UPDATING_INDETERMINATE</a> flag is set in <i>nStatus</i>, this parameter is ignored.
     * @param {Integer} uMaxStep Type: <b>ULONG</b>
     * 
     * The total number of steps required to complete the synchronization of the item. If the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_UPDATING_INDETERMINATE</a> flag is set in <i>nStatus</i>, this parameter is ignored.
     * @param {Pointer<Integer>} pnCancelRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a>*</b>
     * 
     * When this method returns, points to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> enumeration specifying the nature of a cancel request, if any.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress
     */
    ReportProgress(pszItemID, pszProgressText, nStatus, uCurrentStep, uMaxStep, pnCancelRequest) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszItemID, "ptr", pszProgressText, "int", nStatus, "uint", uCurrentStep, "uint", uMaxStep, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * Sets the content of an information field for the handler while that handler is performing a synchronization.
     * @param {PWSTR} pszProgressText Type: <b>LPCWSTR</b>
     * 
     * Pointer to a buffer containing the comment text.
     * @param {Pointer<Integer>} pnCancelRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a>*</b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> enumeration specifying the nature of a cancel request, if any.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-sethandlerprogresstext
     */
    SetHandlerProgressText(pszProgressText, pnCancelRequest) {
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pszProgressText, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * Provides an event to add to the Sync Results folder for an item being synchronized.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the unique ID of the item currently being synchronized. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} nLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a> enumeration declaring the type of event involved.
     * @param {Integer} nFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a></b>
     * 
     * Not used.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the name of the event.
     * @param {PWSTR} pszDescription Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains a description of the event.
     * @param {PWSTR} pszLinkText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the text to be used in a hyperlink to the item. This parameter can be <b>NULL</b>
     * @param {PWSTR} pszLinkReference Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the URL of the item. This parameter can be <b>NULL</b>
     * @param {PWSTR} pszContext Type: <b>LPCWSTR</b>
     * 
     * Handler-specific data to associate with the event.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, contains a pointer to a unique ID for the event.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-reportevent
     */
    ReportEvent(pszItemID, nLevel, nFlags, pszName, pszDescription, pszLinkText, pszLinkReference, pszContext) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription
        pszLinkText := pszLinkText is String ? StrPtr(pszLinkText) : pszLinkText
        pszLinkReference := pszLinkReference is String ? StrPtr(pszLinkReference) : pszLinkReference
        pszContext := pszContext is String ? StrPtr(pszContext) : pszContext

        pguidEventID := Guid()
        result := ComCall(5, this, "ptr", pszItemID, "int", nLevel, "int", nFlags, "ptr", pszName, "ptr", pszDescription, "ptr", pszLinkText, "ptr", pszLinkReference, "ptr", pszContext, "ptr", pguidEventID, "HRESULT")
        return pguidEventID
    }

    /**
     * Determines whether the synchronization has been canceled.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the ID of the item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Return Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>A cancellation has not been requested. The synchronization can continue.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>A cancellation has been requested. The handler should call <a href="/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress">ISyncMgrSyncCallback::ReportProgress</a>, specifying SYNCMGR_PS_CANCELED in the <i>nStatus</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>The value pointed to by <i>pszItemID</i> is either unknown to Sync Center or is not an item managed by this handler.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>pszItemID</i> is <b>NULL</b> or an empty string, the return value depends on whether a cancellation has been requested for the entire handler.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-cancontinue
     */
    CanContinue(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(6, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * Retrieves an enumerator of the set of items that have a pending request to be synchronized. This is the set of items that will be synchronized after the current synchronization is finished.
     * @param {Pointer<IEnumString>} ppenumItemIDs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> that enumerates sync item IDs. This value is <b>NULL</b> if no items are pending.
     * @param {Pointer<IEnumUnknown>} ppenumPunks Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> enumerating <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interfaces that are passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-starthandlersync">StartHandlerSync</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-startitemsync">StartItemSync</a>. This value is <b>NULL</b> if no interfaces are pending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise. Returns <b>S_FALSE</b> if no items are pending.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-queryforadditionalitems
     */
    QueryForAdditionalItems(ppenumItemIDs, ppenumPunks) {
        result := ComCall(7, this, "ptr*", ppenumItemIDs, "ptr*", ppenumPunks, "HRESULT")
        return result
    }

    /**
     * Adds a specified item to the set of items currently being synchronized.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item to add. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if <i>pszItemID</i> is already part of the session.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-additemtosession
     */
    AddItemToSession(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(8, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    AddIUnknownToSession(punk) {
        result := ComCall(9, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Proposes the addition of a new item to the set of items previously enumerated.
     * @param {ISyncMgrSyncItem} pNewItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>*</b>
     * 
     * A pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a> representing the new item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if <i>pszItemID</i> already exists.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem
     */
    ProposeItem(pNewItem) {
        result := ComCall(10, this, "ptr", pNewItem, "HRESULT")
        return result
    }

    /**
     * Confirms a specified item as a member of the handler's sync set and confirms that it should be shown in the UI.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR*</b>
     * 
     * A pointer to a buffer containing the unique ID of the item to confirm. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if the item has not been first submitted through <a href="/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem">ISyncMgrSyncCallback::ProposeItem</a> or if the item is already part of the current session.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-commititem
     */
    CommitItem(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(11, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * Reports that a synchronization operation is being performed that was requested manually from outside the Sync Center UI.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynccallback-reportmanualsync
     */
    ReportManualSync() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
