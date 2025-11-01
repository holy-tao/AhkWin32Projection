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
     * 
     * @param {PWSTR} pszItemID 
     * @param {PWSTR} pszProgressText 
     * @param {Integer} nStatus 
     * @param {Integer} uCurrentStep 
     * @param {Integer} uMaxStep 
     * @param {Pointer<Integer>} pnCancelRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress
     */
    ReportProgress(pszItemID, pszProgressText, nStatus, uCurrentStep, uMaxStep, pnCancelRequest) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszItemID, "ptr", pszProgressText, "int", nStatus, "uint", uCurrentStep, "uint", uMaxStep, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszProgressText 
     * @param {Pointer<Integer>} pnCancelRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-sethandlerprogresstext
     */
    SetHandlerProgressText(pszProgressText, pnCancelRequest) {
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        pnCancelRequestMarshal := pnCancelRequest is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pszProgressText, pnCancelRequestMarshal, pnCancelRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszItemID 
     * @param {Integer} nLevel 
     * @param {Integer} nFlags 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszDescription 
     * @param {PWSTR} pszLinkText 
     * @param {PWSTR} pszLinkReference 
     * @param {PWSTR} pszContext 
     * @param {Pointer<Guid>} pguidEventID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportevent
     */
    ReportEvent(pszItemID, nLevel, nFlags, pszName, pszDescription, pszLinkText, pszLinkReference, pszContext, pguidEventID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription
        pszLinkText := pszLinkText is String ? StrPtr(pszLinkText) : pszLinkText
        pszLinkReference := pszLinkReference is String ? StrPtr(pszLinkReference) : pszLinkReference
        pszContext := pszContext is String ? StrPtr(pszContext) : pszContext

        result := ComCall(5, this, "ptr", pszItemID, "int", nLevel, "int", nFlags, "ptr", pszName, "ptr", pszDescription, "ptr", pszLinkText, "ptr", pszLinkReference, "ptr", pszContext, "ptr", pguidEventID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszItemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-cancontinue
     */
    CanContinue(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(6, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppenumItemIDs 
     * @param {Pointer<IEnumUnknown>} ppenumPunks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-queryforadditionalitems
     */
    QueryForAdditionalItems(ppenumItemIDs, ppenumPunks) {
        result := ComCall(7, this, "ptr*", ppenumItemIDs, "ptr*", ppenumPunks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszItemID 
     * @returns {HRESULT} 
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
     * 
     * @param {ISyncMgrSyncItem} pNewItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem
     */
    ProposeItem(pNewItem) {
        result := ComCall(10, this, "ptr", pNewItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszItemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-commititem
     */
    CommitItem(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(11, this, "ptr", pszItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportmanualsync
     */
    ReportManualSync() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
