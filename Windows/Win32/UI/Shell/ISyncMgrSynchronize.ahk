#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrEnumItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the registered application or service to receive notifications from the synchronization manager.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface should be implemented on the registered application's handler to receive notifications from the synchronization manager and to participate in the synchronization process.
 * 
 * <b>ISyncMgrSynchronize</b> has been replaced in Windows Vista by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a>.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * The synchronization manager calls the methods of this interface to send notifications to the registered application or service during synchronization.
 * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nn-mobsync-isyncmgrsynchronize
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
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG</a> enumeration values apply through the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a> interface, and are used by the other 
     * <b>ISyncMgrSynchronize</b> methods.
     * 
     * If an application does not recognize the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG</a> event, the application should treat the event as a manual synchronization.
     * 
     * A registered application handler cannot display a user interface within this call unless it is the first time the initialization method is called. An application can display any one-time initialization it needs to set up items and introduce a user to an application feature. If you need to display a user interface for a different reason as part of the synchronization process, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">ISyncMgrSynchronize::PrepareForSync</a> method.
     * 
     * The <i>lpCookie</i> parameter is <b>NULL</b> unless a handling application invokes the synchronization manager programmatically by using <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizeinvoke-updateitems">UpdateItems</a>. In this scenario, the class identifier (CLSID) identifies the handling application, and the value of <i>lpCookie</i> is passed in by the handling application, and then passed back by the synchronization manager during synchronization for context. The <i>lpCookie</i> parameter is only meaningful when <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_INVOKE</a> is set.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-initialize
     */
    Initialize(dwReserved, dwSyncMgrFlags, cbCookie, lpCookie) {
        lpCookieMarshal := lpCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwReserved, "uint", dwSyncMgrFlags, "uint", cbCookie, lpCookieMarshal, lpCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains handler information.
     * @remarks
     * The handler should use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate memory.
     * @returns {Pointer<SYNCMGRHANDLERINFO>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrhandlerinfo">SYNCMGRHANDLERINFO</a>**</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrhandlerinfo">SYNCMGRHANDLERINFO</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-gethandlerinfo
     */
    GetHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppSyncMgrHandlerInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSyncMgrHandlerInfo
    }

    /**
     * Obtains the ISyncMgrEnumItems interface for the items that are handled by a registered application.
     * @remarks
     * The enumeration object that this method creates implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a> interface, which is a standard enumeration interface that contains the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrenumitems-next">Next</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrenumitems-reset">Reset</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrenumitems-clone">Clone</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrenumitems-skip">Skip</a> methods.
     * @returns {ISyncMgrEnumItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a>**</b>
     * 
     * The address of the variable that receives a pointer to a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-enumsyncmgritems
     */
    EnumSyncMgrItems() {
        result := ComCall(5, this, "ptr*", &ppSyncMgrEnumItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyncMgrEnumItems(ppSyncMgrEnumItems)
    }

    /**
     * Obtains an interface on a specified item that a registered application handles.
     * @remarks
     * This method exists only for forward compatibility. Currently, there are no interfaces defined on an item. Application implementers must return E_NOTIMPL from this method.
     * @param {Pointer<Guid>} ItemID Type: <b>REFGUID</b>
     * 
     * An identifier for a requested item.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An identifier for a requested interface.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * An address of a variable that receives a pointer to a requested interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-getitemobject
     */
    GetItemObject(ItemID, riid) {
        result := ComCall(6, this, "ptr", ItemID, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Called by the synchronization manager when a user selects an item in the choice dialog box, and then clicks the Properties button.
     * @remarks
     * If a registered application provides a properties dialog box for an item, it must set the SYNCMGRITEM_HASPROPERTIES bit in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgritem">SYNCMGRITEM</a> structure.
     * 
     * If <i>ItemID</i> is GUID_NULL the handler should show the properties dialog for the overall handler.
     * 
     * The appearance of the displayed dialog box should be consistent with a standard property page dialog box.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-showproperties
     */
    ShowProperties(hWndParent, ItemID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(7, this, "ptr", hWndParent, "ptr", ItemID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the ISyncMgrSynchronizeCallback interface. Registered applications use this callback interface to give status information from within the ISyncMgrSynchronize::PrepareForSync and ISyncMgrSynchronize::Synchronize methods.
     * @remarks
     * Registered applications must call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">ISyncMgrSynchronizeCallback::AddRef</a> method and use it when calling SyncMgr to provide status text and progress indicator feedback.
     * 
     * If the registered application already has an <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> interface when the method is called, the old interface must be released and the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method of the new interface must be called. The new interface must be maintained by the registered application.
     * 
     * Before the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a> interface is released, SyncMgr calls this method with the <i>pSyncCallBack</i> parameter set to <b>NULL</b>. The registered application should then release the <b>ISyncMgrSynchronize</b> interface previously passed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-setprogresscallback
     */
    SetProgressCallback(lpCallBack) {
        result := ComCall(8, this, "ptr", lpCallBack, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows a registered application to display any user interface, and perform any necessary initialization before the ISyncMgrSynchronize::Synchronize method is called.
     * @remarks
     * A registered application handler should return from this method as soon as possible, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-prepareforsynccompleted">PrepareForSyncCompleted</a> method. A registered application handler can call the <b>PrepareForSyncCompleted</b> method before returning from this method.
     * 
     * Registered applications should only show a user interface if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_MAYBOTHERUSER</a> flag is set in the <i>dwSyncFlags</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-initialize">ISyncMgrSynchronize::Initialize</a> method. If a registered application cannot prepare for synchronization without showing a user interface when the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_MAYBOTHERUSER</a> flag is not set, it should return S_FALSE from this method.
     * 
     * The array of item IDs that are passed into this method are relevant to the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">ISyncMgrSynchronize::Synchronize</a> method also.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> methods can be called on any thread in a registered application.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync
     */
    PrepareForSync(cbNumItems, pItemIDs, hWndParent, dwReserved) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(9, this, "uint", cbNumItems, "ptr", pItemIDs, "ptr", hWndParent, "uint", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the synchronization manager once for each selected group after the user has chosen the registered applications to be synchronized.
     * @remarks
     * If the user does not select any item choices for the registered application, the <b>ISyncMgrSynchronize::Synchronize</b> method is not called and the interface is released. If this method is called, the application must synchronize the items that were specified in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">ISyncMgrSynchronize::PrepareForSync</a> method.
     * 
     * The registered application's handler should return from the <b>ISyncMgrSynchronize::Synchronize</b> method as soon as possible and then call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-synchronizecompleted">SynchronizeCompleted</a> method. It is acceptable for the handler to call the <b>SynchronizeCompleted</b> call before returning from the <b>ISyncMgrSynchronize::Synchronize</b> method.
     * 
     * The application must give progress feedback and check whether the synchronization should be canceled by using the <i>pSyncCallBack</i> interface pointer that was set up in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-setprogresscallback">ISyncMgrSynchronize::SetProgressCallback</a> method.
     * 
     * Applications must provide progress information even if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_MAYBOTHERUSER</a> flag was not specified in <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-initialize">ISyncMgrSynchronize::Initialize</a>.
     * 
     * Applications should try not to show user interface elements from within the 
     * <b>ISyncMgrSynchronize::Synchronize</b> method. Any user interface elements should be shown in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">ISyncMgrSynchronize::PrepareForSync</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showerror">ISyncMgrSynchronize::ShowError</a> methods so the end user experiences a consistent user interface which is limited to logon and to specifying shares to be synchronized. Subsequently, the synchronization can be performed without any user intervention. After the synchronization is complete, conflicts or other error messages can be shown.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> methods can be called on any thread in your application.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize
     */
    Synchronize(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(10, this, "ptr", hWndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the synchronization manager in a registered application's handler to change the status of an item in the following two cases:\_between the time the handler has returned from the ISyncMgrSynchronize::PrepareForSync method and called the PrepareForSyncCompleted callback method, or after the handler has returned from the ISyncMgrSynchronize::Synchronize method but has not yet called the SynchronizeCompleted callback method.
     * @remarks
     * Currently, the only <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrstatus">SYNCMGRSTATUS</a> status value supported by the SyncMgr is SYNCMGRSTATUS_SKIPPED. The registered application's handler should skip the item specified in <i>pItemID</i> when it receives this status value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-setitemstatus
     */
    SetItemStatus(pItemID, dwSyncMgrStatus) {
        result := ComCall(11, this, "ptr", pItemID, "uint", dwSyncMgrStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the synchronization manager in a registered application handler when a user double-clicks an associated message in the error tab.
     * @remarks
     * Handlers should return as soon as possible from this method, and call the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-showerrorcompleted">ShowErrorCompleted</a> method. A handler can make a call to 
     * <b>ShowErrorCompleted</b> before returning from this method. If a handler returns a failure code from this method, it should not call the 
     * <b>ShowErrorCompleted</b> method.
     * 
     * Applications can display user interface elements in this method even if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_MAYBOTHERUSER</a> flag is not set in the <i>dwSyncFlags</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-initialize">ISyncMgrSynchronize::Initialize</a> method. Applications must still call <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-enablemodeless">EnableModeless</a>, and check the return code before showing a user interface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrsynchronize-showerror
     */
    ShowError(hWndParent, ErrorID) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(12, this, "ptr", hWndParent, "ptr", ErrorID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
