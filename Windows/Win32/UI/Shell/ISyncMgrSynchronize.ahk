#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the registered application or service to receive notifications from the synchronization manager.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * This interface should be implemented on the registered application's handler to receive notifications from the synchronization manager and to participate in the synchronization process.
  * 
  * <b>ISyncMgrSynchronize</b> has been replaced in Windows Vista by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * The synchronization manager calls the methods of this interface to send notifications to the registered application or service during synchronization.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/nn-mobsync-isyncmgrsynchronize
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSynchronize extends IUnknown{
    /**
     * The interface identifier for ISyncMgrSynchronize
     * @type {Guid}
     */
    static IID => Guid("{6295df40-35ee-11d1-8707-00c04fd93327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} dwReserved 
     * @param {Integer} dwSyncMgrFlags 
     * @param {Integer} cbCookie 
     * @param {Pointer<Byte>} lpCookie 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(dwReserved, dwSyncMgrFlags, cbCookie, lpCookie) {
        result := ComCall(3, this, "uint", dwReserved, "uint", dwSyncMgrFlags, "uint", cbCookie, "char*", lpCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYNCMGRHANDLERINFO>} ppSyncMgrHandlerInfo 
     * @returns {HRESULT} 
     */
    GetHandlerInfo(ppSyncMgrHandlerInfo) {
        result := ComCall(4, this, "ptr", ppSyncMgrHandlerInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrEnumItems>} ppSyncMgrEnumItems 
     * @returns {HRESULT} 
     */
    EnumSyncMgrItems(ppSyncMgrEnumItems) {
        result := ComCall(5, this, "ptr", ppSyncMgrEnumItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ItemID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetItemObject(ItemID, riid, ppv) {
        result := ComCall(6, this, "ptr", ItemID, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<Guid>} ItemID 
     * @returns {HRESULT} 
     */
    ShowProperties(hWndParent, ItemID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(7, this, "ptr", hWndParent, "ptr", ItemID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrSynchronizeCallback>} lpCallBack 
     * @returns {HRESULT} 
     */
    SetProgressCallback(lpCallBack) {
        result := ComCall(8, this, "ptr", lpCallBack, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbNumItems 
     * @param {Pointer<Guid>} pItemIDs 
     * @param {HWND} hWndParent 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    PrepareForSync(cbNumItems, pItemIDs, hWndParent, dwReserved) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(9, this, "uint", cbNumItems, "ptr", pItemIDs, "ptr", hWndParent, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @returns {HRESULT} 
     */
    Synchronize(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(10, this, "ptr", hWndParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pItemID 
     * @param {Integer} dwSyncMgrStatus 
     * @returns {HRESULT} 
     */
    SetItemStatus(pItemID, dwSyncMgrStatus) {
        result := ComCall(11, this, "ptr", pItemID, "uint", dwSyncMgrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<Guid>} ErrorID 
     * @returns {HRESULT} 
     */
    ShowError(hWndParent, ErrorID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(12, this, "ptr", hWndParent, "ptr", ErrorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
