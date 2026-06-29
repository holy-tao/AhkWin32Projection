#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumString.ahk" { IEnumString }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import ".\SYNCMGR_EVENT_FLAGS.ahk" { SYNCMGR_EVENT_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncMgrSyncItem.ahk" { ISyncMgrSyncItem }
#Import ".\SYNCMGR_EVENT_LEVEL.ahk" { SYNCMGR_EVENT_LEVEL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNCMGR_CANCEL_REQUEST.ahk" { SYNCMGR_CANCEL_REQUEST }
#Import ".\SYNCMGR_PROGRESS_STATUS.ahk" { SYNCMGR_PROGRESS_STATUS }

/**
 * Exposes methods that allow a synchronization process to report progress and events to Sync Center, or to query whether the process has been canceled.
 * @remarks
 * This interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession">ISyncMgrSessionCreator::CreateSession</a>, which in turn is referenced in the call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">ISyncMgrHandler::Synchronize</a>.
 * 
 * The handler is expected to call this interface to update the folder's progress UI  for each item and to notify Sync Center when it has completed the synchronization of each item.
 * 
 * <b>ISyncMgrSyncCallback</b> is a replacement for <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsynccallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSyncCallback extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSyncCallback
     * @type {Guid}
     */
    static IID := Guid("{884ccd87-b139-4937-a4ba-4f8e19513fbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportProgress          : IntPtr
        SetHandlerProgressText  : IntPtr
        ReportEvent             : IntPtr
        CanContinue             : IntPtr
        QueryForAdditionalItems : IntPtr
        AddItemToSession        : IntPtr
        AddIUnknownToSession    : IntPtr
        ProposeItem             : IntPtr
        CommitItem              : IntPtr
        ReportManualSync        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports the progress of the synchronization of a single sync item to Sync Center.
     * @remarks
     * If you want to report progress on the handler rather than individual sync items, call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-sethandlerprogresstext">ISyncMgrSyncCallback::SetHandlerProgressText</a>.
     * 
     * If the synchronization has been canceled, the handler calls <b>ISyncMgrSyncCallback::ReportProgress</b> on the item one final time, acknowledging the cancellation request by specifying <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_CANCELED</a> in the <i>nStatus</i> parameter. This updates the UI and also allows the user to restart a sync for that item.
     * 
     * Once this method reports a completion status (<a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_SUCCEEDED</a>, <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_FAILED</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_CANCELED</a>), the only further status report that can be made is <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_FAILED</a>. Any other value causes this method to return E_ACCESSDENIED and Sync Center to mark the item as failed.
     * 
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-progress">Progress</a>.
     * 
     * The maximum length of a progress string is MAX_SYNCMGR_PROGRESSTEXT. This constant is defined in SyncMgr.h.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item currently being synchronized. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszProgressText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing a Unicode string for any custom progress messaging for this item.
     * @param {SYNCMGR_PROGRESS_STATUS} nStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PROGRESS_STATUS</a> enumeration stating the current progress status of the synchronization.
     * @param {Integer} uCurrentStep Type: <b>ULONG</b>
     * 
     * The current step in the synchronization. If the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_UPDATING_INDETERMINATE</a> flag is set in <i>nStatus</i>, this parameter is ignored.
     * @param {Integer} uMaxStep Type: <b>ULONG</b>
     * 
     * The total number of steps required to complete the synchronization of the item. If the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_progress_status">SYNCMGR_PS_UPDATING_INDETERMINATE</a> flag is set in <i>nStatus</i>, this parameter is ignored.
     * @param {Pointer<SYNCMGR_CANCEL_REQUEST>} pnCancelRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a>*</b>
     * 
     * When this method returns, points to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> enumeration specifying the nature of a cancel request, if any.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress
     */
    ReportProgress(pszItemID, pszProgressText, nStatus, uCurrentStep, uMaxStep, pnCancelRequest) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszItemID, "ptr", pszProgressText, SYNCMGR_PROGRESS_STATUS, nStatus, "uint", uCurrentStep, "uint", uMaxStep, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * Sets the content of an information field for the handler while that handler is performing a synchronization.
     * @param {PWSTR} pszProgressText Type: <b>LPCWSTR</b>
     * 
     * Pointer to a buffer containing the comment text.
     * @param {Pointer<SYNCMGR_CANCEL_REQUEST>} pnCancelRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a>*</b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> enumeration specifying the nature of a cancel request, if any.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-sethandlerprogresstext
     */
    SetHandlerProgressText(pszProgressText, pnCancelRequest) {
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pszProgressText, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * Provides an event to add to the Sync Results folder for an item being synchronized.
     * @remarks
     * For the handler to provide more details to the user about the sync result, the property sheet for individual sync results reported by the handler can be extended.
     * 
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror">LogError</a>.
     * 
     * The event is stored only in memory, so all events are cleared when the user logs off or shuts down. This is one reason to implement a custom <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgreventstore">ISyncMgrEventStore</a>, which can provide its events from anywhere, including a file, over the network, or the registry. The sync results folder, however, shows events provided both by the internal event store and by custom event stores provided by sync handlers.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the unique ID of the item currently being synchronized. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {SYNCMGR_EVENT_LEVEL} nLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_level">SYNCMGR_EVENT_LEVEL</a> enumeration declaring the type of event involved.
     * @param {SYNCMGR_EVENT_FLAGS} nFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EVENT_FLAGS</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportevent
     */
    ReportEvent(pszItemID, nLevel, nFlags, pszName, pszDescription, pszLinkText, pszLinkReference, pszContext) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription
        pszLinkText := pszLinkText is String ? StrPtr(pszLinkText) : pszLinkText
        pszLinkReference := pszLinkReference is String ? StrPtr(pszLinkReference) : pszLinkReference
        pszContext := pszContext is String ? StrPtr(pszContext) : pszContext

        pguidEventID := Guid()
        result := ComCall(5, this, "ptr", pszItemID, SYNCMGR_EVENT_LEVEL, nLevel, SYNCMGR_EVENT_FLAGS, nFlags, "ptr", pszName, "ptr", pszDescription, "ptr", pszLinkText, "ptr", pszLinkReference, "ptr", pszContext, Guid.Ptr, pguidEventID, "HRESULT")
        return pguidEventID
    }

    /**
     * Determines whether the synchronization has been canceled.
     * @remarks
     * A synchronization can be canceled by the user by clicking the <b>Stop</b> or <b>Stop All</b> task on the context menu or the command module. It can also be canceled when an application calls one of the stop methods of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a> interface.
     * 
     * By implementing this functionality as a separate method, the handler can check for a cancellation without reporting progress.
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
     * <td>A cancellation has been requested. The handler should call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress">ISyncMgrSyncCallback::ReportProgress</a>, specifying SYNCMGR_PS_CANCELED in the <i>nStatus</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>The value pointed to by <i>pszItemID</i> is either unknown to Sync Center or is not an item managed by this handler.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>pszItemID</i> is <b>NULL</b> or an empty string, the return value depends on whether a cancellation has been requested for the entire handler.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-cancontinue
     */
    CanContinue(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(6, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * Retrieves an enumerator of the set of items that have a pending request to be synchronized. This is the set of items that will be synchronized after the current synchronization is finished.
     * @remarks
     * Item IDs retrieved by a call to the <b>Next</b> method of the retrieved enumerator interface have a maximum length of <b>MAX_SYNCMGR_ID</b> including the terminating null character. The calling application is responsible for deallocating each item ID retrieved through the <b>Next</b> method by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<IEnumString>} ppenumItemIDs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> that enumerates sync item IDs. This value is <b>NULL</b> if no items are pending.
     * @param {Pointer<IEnumUnknown>} ppenumPunks Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> enumerating <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interfaces that are passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-starthandlersync">StartHandlerSync</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-startitemsync">StartItemSync</a>. This value is <b>NULL</b> if no interfaces are pending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise. Returns <b>S_FALSE</b> if no items are pending.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-queryforadditionalitems
     */
    QueryForAdditionalItems(ppenumItemIDs, ppenumPunks) {
        result := ComCall(7, this, IEnumString.Ptr, ppenumItemIDs, IEnumUnknown.Ptr, ppenumPunks, "HRESULT")
        return result
    }

    /**
     * Adds a specified item to the set of items currently being synchronized.
     * @remarks
     * <b>ISyncMgrSyncCallback::AddItemToSession</b> is called by the sync handler.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item to add. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if <i>pszItemID</i> is already part of the session.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-additemtosession
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
     * @remarks
     * <b>ISyncMgrSyncCallback::ProposeItem</b> is typically called when items are not considered part of the sync set unless they have been successfully synchronized. Sync Center does not display this item in the UI until the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-commititem">ISyncMgrSyncCallback::CommitItem</a> method has been called.
     * @param {ISyncMgrSyncItem} pNewItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>*</b>
     * 
     * A pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a> representing the new item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if <i>pszItemID</i> already exists.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem
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
     * Returns S_OK if successful, or an error value otherwise. Returns E_INVALIDARG if the item has not been first submitted through <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem">ISyncMgrSyncCallback::ProposeItem</a> or if the item is already part of the current session.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-commititem
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportmanualsync
     */
    ReportManualSync() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrSyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportProgress := CallbackCreate(GetMethod(implObj, "ReportProgress"), flags, 7)
        this.vtbl.SetHandlerProgressText := CallbackCreate(GetMethod(implObj, "SetHandlerProgressText"), flags, 3)
        this.vtbl.ReportEvent := CallbackCreate(GetMethod(implObj, "ReportEvent"), flags, 10)
        this.vtbl.CanContinue := CallbackCreate(GetMethod(implObj, "CanContinue"), flags, 2)
        this.vtbl.QueryForAdditionalItems := CallbackCreate(GetMethod(implObj, "QueryForAdditionalItems"), flags, 3)
        this.vtbl.AddItemToSession := CallbackCreate(GetMethod(implObj, "AddItemToSession"), flags, 2)
        this.vtbl.AddIUnknownToSession := CallbackCreate(GetMethod(implObj, "AddIUnknownToSession"), flags, 2)
        this.vtbl.ProposeItem := CallbackCreate(GetMethod(implObj, "ProposeItem"), flags, 2)
        this.vtbl.CommitItem := CallbackCreate(GetMethod(implObj, "CommitItem"), flags, 2)
        this.vtbl.ReportManualSync := CallbackCreate(GetMethod(implObj, "ReportManualSync"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportProgress)
        CallbackFree(this.vtbl.SetHandlerProgressText)
        CallbackFree(this.vtbl.ReportEvent)
        CallbackFree(this.vtbl.CanContinue)
        CallbackFree(this.vtbl.QueryForAdditionalItems)
        CallbackFree(this.vtbl.AddItemToSession)
        CallbackFree(this.vtbl.AddIUnknownToSession)
        CallbackFree(this.vtbl.ProposeItem)
        CallbackFree(this.vtbl.CommitItem)
        CallbackFree(this.vtbl.ReportManualSync)
    }
}
