#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrEnumItems.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetHandlerInfo", "EnumSyncMgrItems", "GetItemObject", "ShowProperties", "SetProgressCallback", "PrepareForSync", "Synchronize", "SetItemStatus", "ShowError"]

    /**
     * Called by the synchronization manager in a registered application handler to determine whether the handler processes the synchronization event.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved; must be 0 (zero).
     * @param {Integer} dwSyncMgrFlags Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG</a> enumeration values that describe how a synchronization event is initiated.
     * @param {Integer} cbCookie Type: <b>DWORD</b>
     * 
     * The size of the <i>lpCookie</i> data, in bytes.
     * @param {Pointer<Integer>} lpCookie Type: <b>BYTE const*</b>
     * 
     * A pointer to the token that identifies an application. This token is passed when an application invokes the synchronization manager programmatically.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, and the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Initialization is successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application handler does not process a synchronization event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-initialize
     */
    Initialize(dwReserved, dwSyncMgrFlags, cbCookie, lpCookie) {
        lpCookieMarshal := lpCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwReserved, "uint", dwSyncMgrFlags, "uint", cbCookie, lpCookieMarshal, lpCookie, "HRESULT")
        return result
    }

    /**
     * Obtains handler information.
     * @returns {Pointer<SYNCMGRHANDLERINFO>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrhandlerinfo">SYNCMGRHANDLERINFO</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrhandlerinfo">SYNCMGRHANDLERINFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-gethandlerinfo
     */
    GetHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppSyncMgrHandlerInfo := 0, "HRESULT")
        return ppSyncMgrHandlerInfo
    }

    /**
     * Obtains the ISyncMgrEnumItems interface for the items that are handled by a registered application.
     * @returns {ISyncMgrEnumItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a>**</b>
     * 
     * The address of the variable that receives a pointer to a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-enumsyncmgritems
     */
    EnumSyncMgrItems() {
        result := ComCall(5, this, "ptr*", &ppSyncMgrEnumItems := 0, "HRESULT")
        return ISyncMgrEnumItems(ppSyncMgrEnumItems)
    }

    /**
     * Obtains an interface on a specified item that a registered application handles.
     * @param {Pointer<Guid>} ItemID Type: <b>REFGUID</b>
     * 
     * An identifier for a requested item.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An identifier for a requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * An address of a variable that receives a pointer to a requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-getitemobject
     */
    GetItemObject(ItemID, riid) {
        result := ComCall(6, this, "ptr", ItemID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Called by the synchronization manager when a user selects an item in the choice dialog box, and then clicks the Properties button.
     * @param {HWND} hWndParent Type: <b>HWND</b>
     * 
     * The parent <b>HWND</b> for any user interface that a registered application displays to set properties. This value can be <b>NULL</b>.
     * @param {Pointer<Guid>} ItemID Type: <b>REFGUID</b>
     * 
     * The item ID for properties that are requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, and the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The properties dialog for an item is handled successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-showproperties
     */
    ShowProperties(hWndParent, ItemID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(7, this, "ptr", hWndParent, "ptr", ItemID, "HRESULT")
        return result
    }

    /**
     * Sets the ISyncMgrSynchronizeCallback interface. Registered applications use this callback interface to give status information from within the ISyncMgrSynchronize::PrepareForSync and ISyncMgrSynchronize::Synchronize methods.
     * @param {ISyncMgrSynchronizeCallback} lpCallBack Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a>*</b>
     * 
     * A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> interface the registered application uses to provide feedback to SyncMgr about the synchronization status and to notify SyncMgr when the synchronization is complete.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Synchronization callback interface was successfully set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-setprogresscallback
     */
    SetProgressCallback(lpCallBack) {
        result := ComCall(8, this, "ptr", lpCallBack, "HRESULT")
        return result
    }

    /**
     * Allows a registered application to display any user interface, and perform any necessary initialization before the ISyncMgrSynchronize::Synchronize method is called.
     * @param {Integer} cbNumItems Type: <b>ULONG</b>
     * 
     * The number of items in the array pointed to by <i>pItemIDs</i>.
     * @param {Pointer<Guid>} pItemIDs Type: <b>GUID*</b>
     * 
     * An array of item IDs that a user chooses to synchronize.
     * @param {HWND} hWndParent Type: <b>HWND</b>
     * 
     * A handle to the parent <b>HWND</b> that a registered application should use for any user interface element displayed. This value may be <b>NULL</b>.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved. Registered applications should ignore this value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, and the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Preparation is successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync
     */
    PrepareForSync(cbNumItems, pItemIDs, hWndParent, dwReserved) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(9, this, "uint", cbNumItems, "ptr", pItemIDs, "ptr", hWndParent, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Called by the synchronization manager once for each selected group after the user has chosen the registered applications to be synchronized.
     * @param {HWND} hWndParent Type: <b>HWND</b>
     * 
     * A handle to the parent <b>HWND</b> the registered application should use for any user interface elements that it displays. This value may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Synchronization was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Synchronization failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-synchronize
     */
    Synchronize(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(10, this, "ptr", hWndParent, "HRESULT")
        return result
    }

    /**
     * Called by the synchronization manager in a registered application's handler to change the status of an item in the following two cases:\_between the time the handler has returned from the ISyncMgrSynchronize::PrepareForSync method and called the PrepareForSyncCompleted callback method, or after the handler has returned from the ISyncMgrSynchronize::Synchronize method but has not yet called the SynchronizeCompleted callback method.
     * @param {Pointer<Guid>} pItemID Type: <b>REFGUID</b>
     * 
     * Identifies the item with changed status.
     * @param {Integer} dwSyncMgrStatus Type: <b>DWORD</b>
     * 
     * The new status for the specified item taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrstatus">SYNCMGRSTATUS</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Status was set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-setitemstatus
     */
    SetItemStatus(pItemID, dwSyncMgrStatus) {
        result := ComCall(11, this, "ptr", pItemID, "uint", dwSyncMgrStatus, "HRESULT")
        return result
    }

    /**
     * Called by the synchronization manager in a registered application handler when a user double-clicks an associated message in the error tab.
     * @param {HWND} hWndParent Type: <b>HWND</b>
     * 
     * A handle to the parent <b>HWND</b> that a registered application should use to display a user interface. This value can be <b>NULL</b>.
     * @param {Pointer<Guid>} ErrorID Type: <b>REFGUID</b>
     * 
     * An error identifier that is associated with this error message. This value is passed in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror">LogError</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, and the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronize-showerror
     */
    ShowError(hWndParent, ErrorID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(12, this, "ptr", hWndParent, "ptr", ErrorID, "HRESULT")
        return result
    }
}
