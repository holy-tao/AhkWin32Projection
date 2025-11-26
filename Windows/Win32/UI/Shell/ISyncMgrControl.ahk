#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application or handler to start or stop a synchronization, notify Sync Center of changes to the set of handlers or items, or notify of changes to property values.
 * @remarks
 * 
 * <b>ISyncMgrControl</b> is implemented by Sync Center. It can be instantiated by an application or handler as the CLSID_SyncMgrControl object, which is implemented as a Component Object Model (COM) local server. As a result, calls to <b>ISyncMgrControl</b> methods could take considerable time. Those calls should not be made on a UI thread.
 * 
 * All methods of this interface queue their requests with Sync Center.
 * 
 * <b>ISyncMgrControl</b> is a replacement for <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizeinvoke">ISyncMgrSynchronizeInvoke</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrcontrol
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrControl
     * @type {Guid}
     */
    static IID => Guid("{9b63616c-36b2-46bc-959f-c1593952d19b}")

    /**
     * The class identifier for SyncMgrControl
     * @type {Guid}
     */
    static CLSID => Guid("{1a1f4206-0688-4e7f-be03-d82ec69df9a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartHandlerSync", "StartItemSync", "StartSyncAll", "StopHandlerSync", "StopItemSync", "StopSyncAll", "UpdateHandlerCollection", "UpdateHandler", "UpdateItem", "UpdateEvents", "UpdateConflict", "UpdateConflicts", "ActivateHandler", "EnableHandler", "EnableItem"]

    /**
     * Initiates the synchronization of all items managed by a particular handler.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler to synchronize. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window that the handler can use to display any necessary UI. This value can be <b>NULL</b>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">Synchronize</a>. This parameter can be <b>NULL</b>.
     * @param {Integer} nSyncControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags">SYNCMGR_SYNC_CONTROL_FLAGS</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags">SYNCMGR_SYNC_CONTROL_FLAGS</a> enumeration that specifies whether an item found in both a current sync and a queued sync should be synchronized again when the queued sync is performed.
     * @param {ISyncMgrSyncResult} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncresult">ISyncMgrSyncResult</a>*</b>
     * 
     * A pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncresult">ISyncMgrSyncResult</a>, whose <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncresult-result">Result</a> method is called when the synchronization ends, either through success, failure, or cancellation. The <b>Result</b> method is called with the aggregated state of the handler synchronization. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-starthandlersync
     */
    StartHandlerSync(pszHandlerID, hwndOwner, punk, nSyncControlFlags, pResult) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", pszHandlerID, "ptr", hwndOwner, "ptr", punk, "int", nSyncControlFlags, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Initiates the synchronization of specified items managed by a particular handler.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler that manages the items. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Pointer<PWSTR>} ppszItemIDs Type: <b>LPCWSTR*</b>
     * 
     * The address of a pointer to a buffer containing an array of IDs of the items to be synchronized. Each ID is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character. This array is passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">Synchronize</a>.
     * @param {Integer} cItems Type: <b>DWORD</b>
     * 
     * The number of IDs in <i>ppszItemIDs</i>.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window that the item can use to display any necessary UI. This value can be <b>NULL</b>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">Synchronize</a>. This parameter can be <b>NULL</b>.
     * @param {Integer} nSyncControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags">SYNCMGR_SYNC_CONTROL_FLAGS</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags">SYNCMGR_SYNC_CONTROL_FLAGS</a> enumeration that specifies whether an item found in both a current sync and a queued sync should be synchronized again when the queued sync is performed.
     * @param {ISyncMgrSyncResult} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncresult">ISyncMgrSyncResult</a>*</b>
     * 
     * A pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncresult">ISyncMgrSyncResult</a>, whose <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncresult-result">Result</a> method is called when the synchronization ends, either through success, failure, or cancellation. The <b>Result</b> method is called with the aggregated state of the handler synchronization. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-startitemsync
     */
    StartItemSync(pszHandlerID, ppszItemIDs, cItems, hwndOwner, punk, nSyncControlFlags, pResult) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pszHandlerID, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", punk, "int", nSyncControlFlags, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Synchronizes all items managed by all handlers.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to a window that can be used by a handler or item to display any necessary UI. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-startsyncall
     */
    StartSyncAll(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(5, this, "ptr", hwndOwner, "HRESULT")
        return result
    }

    /**
     * Stops the synchronization of a specified handler.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-stophandlersync
     */
    StopHandlerSync(pszHandlerID) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(6, this, "ptr", pszHandlerID, "HRESULT")
        return result
    }

    /**
     * Stops the synchronization of specified items managed by a particular handler.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * a pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Pointer<PWSTR>} ppszItemIDs Type: <b>LPCWSTR*</b>
     * 
     * The address of a pointer to a buffer containing an array of IDs of the items to stop synchronizing. Each ID is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} cItems Type: <b>DWORD</b>
     * 
     * The number of IDs in <i>ppszItemIDs</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-stopitemsync
     */
    StopItemSync(pszHandlerID, ppszItemIDs, cItems) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pszHandlerID, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "HRESULT")
        return result
    }

    /**
     * Stops the synchronization of all items managed by all handlers.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-stopsyncall
     */
    StopSyncAll() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Instructs Sync Center to reenumerate the handler collection, or informs it that properties of a handler in the handler collection have changed.
     * @param {Pointer<Guid>} rclsidCollectionID Type: <b>REFCLSID</b>
     * 
     * A reference to the handler collection's CLSID.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the update should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandlercollection
     */
    UpdateHandlerCollection(rclsidCollectionID, nControlFlags) {
        result := ComCall(9, this, "ptr", rclsidCollectionID, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Instructs Sync Center to reenumerate the items managed by a handler or informs it that properties of the handler have changed.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the update should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler
     */
    UpdateHandler(pszHandlerID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(10, this, "ptr", pszHandlerID, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Informs Sync Center that properties of a sync item have changed.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler that manages the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the update should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem
     */
    UpdateItem(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(11, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Informs Sync Center that events have been added for a specific handler or item.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler that manages the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character. This parameter can be <b>NULL</b> if the event occurred on the handler rather than on a specific item.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the update should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-updateevents
     */
    UpdateEvents(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(12, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {ISyncMgrConflict} pConflict 
     * @param {Integer} nReason 
     * @returns {HRESULT} 
     */
    UpdateConflict(pszHandlerID, pszItemID, pConflict, nReason) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(13, this, "ptr", pszHandlerID, "ptr", pszItemID, "ptr", pConflict, "int", nReason, "HRESULT")
        return result
    }

    /**
     * Informs Sync Center that conflicts have been added for a specific handler or item.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler that manages the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character. This parameter can be <b>NULL</b> if the event occurred on the handler rather than on a specific item.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the update should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-updateconflicts
     */
    UpdateConflicts(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(14, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Activates or deactivates a handler.
     * @param {BOOL} fActivate Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to activate; <b>FALSE</b> to deactivate.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to a window that can be used by the handler to display any necessary UI. This value can be <b>NULL</b>.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the activation or deactivation of the handler should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-activatehandler
     */
    ActivateHandler(fActivate, pszHandlerID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(15, this, "int", fActivate, "ptr", pszHandlerID, "ptr", hwndOwner, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Enables or disables a handler.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to a window that can be used by the handler to display any necessary UI. This value can be <b>NULL</b>.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the enabling or disabling of the handler should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-enablehandler
     */
    EnableHandler(fEnable, pszHandlerID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(16, this, "int", fEnable, "ptr", pszHandlerID, "ptr", hwndOwner, "int", nControlFlags, "HRESULT")
        return result
    }

    /**
     * Enables or disables a sync item managed by a specified handler.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {PWSTR} pszItemID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the item. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to a window that can be used by the item to display any necessary UI. This value can be <b>NULL</b>.
     * @param {Integer} nControlFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> enumeration specifying whether the enabling or disabling of the item should be performed synchronously or asynchronously.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrcontrol-enableitem
     */
    EnableItem(fEnable, pszHandlerID, pszItemID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(17, this, "int", fEnable, "ptr", pszHandlerID, "ptr", pszItemID, "ptr", hwndOwner, "int", nControlFlags, "HRESULT")
        return result
    }
}
