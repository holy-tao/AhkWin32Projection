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
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {HWND} hwndOwner 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} nSyncControlFlags 
     * @param {Pointer<ISyncMgrSyncResult>} pResult 
     * @returns {HRESULT} 
     */
    StartHandlerSync(pszHandlerID, hwndOwner, punk, nSyncControlFlags, pResult) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", pszHandlerID, "ptr", hwndOwner, "ptr", punk, "int", nSyncControlFlags, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {Pointer<PWSTR>} ppszItemIDs 
     * @param {Integer} cItems 
     * @param {HWND} hwndOwner 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} nSyncControlFlags 
     * @param {Pointer<ISyncMgrSyncResult>} pResult 
     * @returns {HRESULT} 
     */
    StartItemSync(pszHandlerID, ppszItemIDs, cItems, hwndOwner, punk, nSyncControlFlags, pResult) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(4, this, "ptr", pszHandlerID, "ptr", ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", punk, "int", nSyncControlFlags, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     */
    StartSyncAll(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(5, this, "ptr", hwndOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @returns {HRESULT} 
     */
    StopHandlerSync(pszHandlerID) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(6, this, "ptr", pszHandlerID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {Pointer<PWSTR>} ppszItemIDs 
     * @param {Integer} cItems 
     * @returns {HRESULT} 
     */
    StopItemSync(pszHandlerID, ppszItemIDs, cItems) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(7, this, "ptr", pszHandlerID, "ptr", ppszItemIDs, "uint", cItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSyncAll() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidCollectionID 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    UpdateHandlerCollection(rclsidCollectionID, nControlFlags) {
        result := ComCall(9, this, "ptr", rclsidCollectionID, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    UpdateHandler(pszHandlerID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(10, this, "ptr", pszHandlerID, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    UpdateItem(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(11, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    UpdateEvents(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(12, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Pointer<ISyncMgrConflict>} pConflict 
     * @param {Integer} nReason 
     * @returns {HRESULT} 
     */
    UpdateConflict(pszHandlerID, pszItemID, pConflict, nReason) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(13, this, "ptr", pszHandlerID, "ptr", pszItemID, "ptr", pConflict, "int", nReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    UpdateConflicts(pszHandlerID, pszItemID, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(14, this, "ptr", pszHandlerID, "ptr", pszItemID, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @param {PWSTR} pszHandlerID 
     * @param {HWND} hwndOwner 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    ActivateHandler(fActivate, pszHandlerID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(15, this, "int", fActivate, "ptr", pszHandlerID, "ptr", hwndOwner, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @param {PWSTR} pszHandlerID 
     * @param {HWND} hwndOwner 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    EnableHandler(fEnable, pszHandlerID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(16, this, "int", fEnable, "ptr", pszHandlerID, "ptr", hwndOwner, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @param {PWSTR} pszHandlerID 
     * @param {PWSTR} pszItemID 
     * @param {HWND} hwndOwner 
     * @param {Integer} nControlFlags 
     * @returns {HRESULT} 
     */
    EnableItem(fEnable, pszHandlerID, pszItemID, hwndOwner, nControlFlags) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(17, this, "int", fEnable, "ptr", pszHandlerID, "ptr", pszItemID, "ptr", hwndOwner, "int", nControlFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
