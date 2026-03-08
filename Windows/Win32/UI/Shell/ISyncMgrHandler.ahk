#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrHandlerInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that make up the primary interface implemented by a sync handler.
 * @remarks
 * <b>ISyncMgrHandler</b> replaces <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a>. Some of the earlier functionality has been streamlined, while some has been moved to other interfaces. See the individual method pages for specific information.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrHandler
     * @type {Guid}
     */
    static IID => Guid("{04ec2e43-ac77-49f9-9b98-0307ef7a72a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetHandlerInfo", "GetObject", "GetCapabilities", "GetPolicies", "Activate", "Enable", "Synchronize"]

    /**
     * Gets the display name of the handler.
     * @remarks
     * The handler name is accessed as the System.DisplayName (PKEY_DisplayName) property in the Sync Center folder.
     * 
     * Sync Center calls this method any time that <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandlercollection">UpdateHandlerCollection</a> is called. If <b>ISyncMgrHandler::GetName</b> fails or returns an empty string, the handler is not shown in the Sync Center folder and Sync Center will not attempt to invoke it.
     * 
     * It is the responsibility of the handler to allocate the string buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * <b>ISyncMgrHandler::GetName</b> replaces the use of <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-gethandlerinfo">GetHandlerInfo</a> to retrieve the handler name.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a <b>null</b>-terminated buffer that receives the handler name. The name can be of maximum length MAX_SYNCMGR_NAME, including the terminating <b>null</b> character. If the name exceeds that length, it is truncated.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets properties that describe the handler.
     * @remarks
     * If this method fails, the handler is still shown in the Sync Center folder and Sync Center continues to invoke it, but default values are used for all properties.
     * 
     * <b>ISyncMgrHandler::GetHandlerInfo</b>, together with <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getname">ISyncMgrHandler::GetName</a>, replaces the older <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-gethandlerinfo">GetHandlerInfo</a>.
     * @returns {ISyncMgrHandlerInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo">ISyncMgrHandlerInfo</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo">ISyncMgrHandlerInfo</a> interface that provides access to the handler properties.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-gethandlerinfo
     */
    GetHandlerInfo() {
        result := ComCall(4, this, "ptr*", &ppHandlerInfo := 0, "HRESULT")
        return ISyncMgrHandlerInfo(ppHandlerInfo)
    }

    /**
     * Creates a specific type of object related to the handler.
     * @remarks
     * The handler can implement the requested interface on itself or it can implement it on a different object.
     * @param {Pointer<Guid>} rguidObjectID Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This depends on the object type named in <i>rguidObjectID</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(5, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a set of flags describing the handler's defined capabilities.
     * @remarks
     * This method is called by Sync Center in response to a call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandlercollection">UpdateHandlerCollection</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HANDLER_CAPABILITIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HANDLER_CAPABILITIES</a> enumeration that defines the capabilities of the handler. Compare against <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HCM_VALID_MASK</a> to verify a valid value.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(6, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * Gets a set of flags describing the policies set by the handler.
     * @remarks
     * A policy is an action that is usually supported but can be disabled by a group policy.
     * 
     * This method is called by Sync Center in response to a call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandlercollection">UpdateHandlerCollection</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HANDLER_POLICIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HANDLER_POLICIES</a> enumeration that define the handler's policies.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-getpolicies
     */
    GetPolicies() {
        result := ComCall(7, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * Requests that the handler is activated or deactivated. An active handler can be synchronized; an inactive handler cannot.
     * @remarks
     * An active handler appears in the Sync Center folder and can be synchronized. An inactive handler appears in the Sync Setup folder and must be activated (which moves it to the Sync Center folder) before it can be synchronized.
     * 
     * The activation state should not be confused with the enabled state. An active handler can be disabled. This means that it is still shown in the Sync Center folder but that it cannot be synchronized.
     * 
     * Sync Center calls this method in the following two instances.
     *             
     *                 
     * 
     * <ul>
     * <li>When the user selects the handler in the Sync Setup folder and launches its <b>Setup</b> task. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">SYNCMGR_OBJECTID_QueryBeforeActivate</a> object, this method is only called if the UI operation, which consists of a dialog asking the user to confirm whether they want to activate the handler, was successful.</li>
     * <li>When the user selects the handler in the Sync Center folder and launches its <b>Delete</b> task, but only if the handler has not set the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HPM_PREVENT_DEACTIVATE</a> flag. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">SYNCMGR_OBJECTID_QueryBeforeDeactivate</a> object, this method is only called if the UI operation was successful.</li>
     * </ul>
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HPM_PREVENT_ACTIVATE</a> flag is set in the value retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a>, a call to this method requesting activation of the handler will fail.
     * 
     * The activation state of an individual handler can be found by calling <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isactive">IsActive</a>.
     * 
     * If the handler does not need to perform any actions when it is activated, it can return either S_OK or E_NOTIMPL as shown in the example below.
     * @param {BOOL} fActivate Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to activate; <b>FALSE</b> to deactivate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-activate
     */
    Activate(fActivate) {
        result := ComCall(8, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * Requests that an active handler be enabled or disabled. An enabled handler can be synchronized and a disabled handler cannot.
     * @remarks
     * A handler must set the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HCM_CAN_ENABLE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HCM_CAN_DISABLE</a> flags for the <b>Enable</b> and <b>Disable</b> entries to appear on the handler's shortcut menu when the handler is shown in the Sync Center folder. Choosing to enable a handler means that it can be synchronized; choosing to disable a handler means that it cannot.
     * 
     * Sync Center calls this method in the following two instances.
     *             
     *                 
     * 
     * <ul>
     * <li>When the user selects the handler in the Sync Center folder and launches its <b>Enable</b> task. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">SYNCMGR_OBJECTID_QueryBeforeEnable</a> object, this method is only called if the UI operation was successful.</li>
     * <li>When the user selects the handler in the Sync Center folder and launches its <b>Disable</b> task. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">SYNCMGR_OBJECTID_QueryBeforeDisable</a> object, this method is only called if the UI operation was successful.</li>
     * </ul>
     * If the handler does not need to perform any actions when it is activated, it can return either S_OK or E_NOTIMPL as shown in the example below.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Initiates a synchronization of a selection of the handler's sync items.
     * @remarks
     * <b>ISyncMgrHandler::Synchronize</b> is called on its own thread. Sync Center instantiates the handler object and the session creator object on that thread and then calls this method. 
     * 
     *                 
     * 
     * The handler can create the session itself by calling the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession">CreateSession</a> method or it can signal an external process to perform the synchronization. If the handler creates the session, it should not return from the <b>ISyncMgrHandler::Synchronize</b> method until synchronization is complete. If the handler delegates synchronization to an external process, the external process should use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create the CLSID_SyncMgrClient object, specifying the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator">ISyncMgrSessionCreator</a> interface. The process then creates the session so that it can report progress.
     * 
     * A user may elect to stop synchronization on an item or handler. An application can also stop synchronization by calling one of the stop methods on the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a> interface, such as <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-stopitemsync">StopItemSync</a>. The following mechanisms are provided to support these scenarios.
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress">ReportProgress</a> returns a parameter indicating whether cancellation has been requested.</li>
     * <li>The handler can call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-cancontinue">CanContinue</a>.</li>
     * </ul>
     * 
     * 
     * If the user asks to sync additional items after the <b>ISyncMgrHandler::Synchronize</b> method has been called, the handler can sync the new items in the same session by querying for them through the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-queryforadditionalitems">QueryForAdditionalItems</a> method on the callback. If they choose to sync an item they queried for, they can then call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-additemtosession">AddItemToSession</a>.
     * 
     * Some handlers will not enumerate an item until it has been synchronized. If the handler discovers such items during a synchronization, it can inform Sync Center about them through the session. For example, if the handler discovers an item to add to the sync set, it calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-proposeitem">ProposeItem</a>. Once the item has been successfully created, the handler calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-commititem">CommitItem</a>. At that point, Sync Center adds it to the list of items that it is tracking for the handler.
     * 
     * The <b>ISyncMgrHandler::Synchronize</b> method is analogous to a combination of the older <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> methods. In the case of the older interface, Sync Center called <b>PrepareForSync</b> immediately followed by <b>Synchronize</b>. The <b>ISyncMgrHandler::Synchronize</b> method provides the functionality of these two methods into a single call.
     * 
     *                 
     * 
     * Another difference between <b>ISyncMgrHandler::Synchronize</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> is that the older method was expected to perform the synchronization asynchronously. <b>Synchronize</b> queued the request in one or more external threads and then returned. It then called <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-synchronizecompleted">SynchronizeCompleted</a> once it had finished synchronizing all items. <b>ISyncMgrHandler::Synchronize</b> supports a synchronous model for in-proc (foreground) synchronization or an asynchronous model for out-of-proc (background) synchronization.
     * @param {Pointer<PWSTR>} ppszItemIDs Type: <b>LPCWSTR*</b>
     * 
     * A pointer to an array of item IDs representing the items to be synchronized. Each item ID is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} cItems Type: <b>ULONG</b>
     * 
     * The number of items in <i>ppszItemIDs</i>.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window that the item uses to display any necessary UI. This value can be <b>NULL</b>.
     * @param {ISyncMgrSessionCreator} pSessionCreator Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator">ISyncMgrSessionCreator</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator">ISyncMgrSessionCreator</a> interface. This interface enables the handler itself to report progress and events, or to signal a background process to report progress and events.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an interface to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a>. <b>ISyncMgrHandler::Synchronize</b> is called either when a user requests a synchronization from the Sync Center folder or when one of the <b>ISyncMgrControl</b> synchronize methods is called, such as <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-startsyncall">StartSyncAll</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize
     */
    Synchronize(ppszItemIDs, cItems, hwndOwner, pSessionCreator, punk) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "ptr", hwndOwner, "ptr", pSessionCreator, "ptr", punk, "HRESULT")
        return result
    }
}
