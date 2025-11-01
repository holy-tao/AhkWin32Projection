#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a handler to provide conflicts that appear in the Conflicts folder.
 * @remarks
 * 
  * Conflict is provided to enable the user to select a version of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> as needed, instead of being forced to pick to complete a sync selection set. The fact that we current display them in the conflict folder is purely secondary. 
  * 
  * The conflict store must notify sync center when its contents change. Nothing is assumed to happen to conflicts when methods are called that affect the conflict. This includes when they are resolved.
  * 
  * Sync Center requests a conflict store from a handler by calling <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> with SYNCMGR_OBJECTID_ConflictStore if the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> includes SYNCMGR_HCM_CONFLICT_STORE. The handler can also provide an event store filtered by item by setting the SYNCMGR_ICM_CONFLICT_STORE flag in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">ISyncMgrSyncItem::GetCapabilities</a>.
  * 
  * If conflicts are added to the conflict store, the handler (or a related component) should call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateconflicts">ISyncMgrControl::UpdateConflicts</a> so that both the Conflicts folder and conflict counts can be updated.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictstore
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflictStore
     * @type {Guid}
     */
    static IID => Guid("{cf8fc579-c396-4774-85f1-d908a831156e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumConflicts", "BindToConflict", "RemoveConflicts", "GetCount"]

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Pointer<IEnumSyncMgrConflict>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-enumconflicts
     */
    EnumConflicts(pszHandlerID, pszItemID, ppEnum) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(3, this, "ptr", pszHandlerID, "ptr", pszItemID, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYNCMGR_CONFLICT_ID_INFO>} pConflictIdInfo 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-bindtoconflict
     */
    BindToConflict(pConflictIdInfo, riid, ppv) {
        result := ComCall(4, this, "ptr", pConflictIdInfo, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYNCMGR_CONFLICT_ID_INFO>} rgConflictIdInfo 
     * @param {Integer} cConflicts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-removeconflicts
     */
    RemoveConflicts(rgConflictIdInfo, cConflicts) {
        result := ComCall(5, this, "ptr", rgConflictIdInfo, "uint", cConflicts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Pointer<Integer>} pnConflicts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-getcount
     */
    GetCount(pszHandlerID, pszItemID, pnConflicts) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(6, this, "ptr", pszHandlerID, "ptr", pszItemID, "uint*", pnConflicts, "HRESULT")
        return result
    }
}
