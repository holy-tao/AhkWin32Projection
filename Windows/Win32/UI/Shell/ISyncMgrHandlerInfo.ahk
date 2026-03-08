#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a handler to provide property and state information to Sync Center.
 * @remarks
 * Handlers should always implement this interface, generally on the same object that implements <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a>. By implementing <b>ISyncMgrHandlerInfo</b>, the set of properties can be changed without requiring the handler to be recompiled. It also provides type-safe access to the properties.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrHandlerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrHandlerInfo
     * @type {Guid}
     */
    static IID => Guid("{4ff1d798-ecf7-4524-aa81-1e362a0aef3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetTypeLabel", "GetComment", "GetLastSyncTime", "IsActive", "IsEnabled", "IsConnected"]

    /**
     * Gets the handler type for Sync Center.
     * @remarks
     * Typically, this value does not change. However, Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a>*</b>
     * 
     * When this method returns, points to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a> enumeration that specifies the handler type. If the method fails, this parameter points to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HT_UNSPECIFIED</a>.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettype
     */
    GetType() {
        result := ComCall(3, this, "int*", &pnType := 0, "HRESULT")
        return pnType
    }

    /**
     * Gets a label for the handler type. This typically provides the model of the device or an equivalent handler-specific identity string.
     * @remarks
     * The label value is displayed as the System.Sync.HandlerTypeLabel (PKEY_Sync_HandlerTypeLabel) property in the folder UI. Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * 
     * The handler is responsible for allocating the string buffer pointed to by <i>ppszTypeLabel</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the label string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettypelabel
     */
    GetTypeLabel() {
        result := ComCall(4, this, "ptr*", &ppszTypeLabel := 0, "HRESULT")
        return ppszTypeLabel
    }

    /**
     * Gets a string that contains commentary regarding the handler.
     * @remarks
     * This string could be provided by a handler to display a summary of contents of the partnership, for instance "32 contacts" or "13 songs". The string can have a maximum length of MAX_SYNCMGR_NAME including the terminating null character.
     * 
     * The comment value is displayed as the System.Sync.Comments (PKEY_Sync_Comments) property in the folder UI when a synchronization is not being performed.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * 
     * The handler is responsible for allocating the string buffer pointed to by <i>ppszComment</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the comment string. This string is of maximum length MAX_SYNCMGR_NAME including the terminating null character.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getcomment
     */
    GetComment() {
        result := ComCall(5, this, "ptr*", &ppszComment := 0, "HRESULT")
        return ppszComment
    }

    /**
     * Gets the date and time when the handler was last synchronized.
     * @remarks
     * This value is not displayed in the folder UI by default, but is available as the System.Sync.DateSynchronized (PKEY_Sync_DateSynchronized) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time information.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getlastsynctime
     */
    GetLastSyncTime() {
        pftLastSync := FILETIME()
        result := ComCall(6, this, "ptr", pftLastSync, "HRESULT")
        return pftLastSync
    }

    /**
     * Gets a value that indicates whether the handler can be synchronized.
     * @remarks
     * If a handler is not active, it appears in the Sync Setup folder. Handlers in that folder cannot be synchronized. To move a handler to the Sync Center folder, the user selects the <b>Setup</b> task on the handler's shortcut menu or from the command module.
     * 
     * If a handler is active it appears in the main Sync Center folder. A handler that is active can be synchronized either by the user or through the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a> interface. To move a handler to the Sync Setup folder, the user selects the <b>Delete</b> task on the handler's shortcut menu or on the command module.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the handler is active; otherwise, S_FALSE.
     *                     
     *                     
     * 
     * If the handler wants Sync Center to maintain the current state, it can return E_NOTIMPL. If any other value is returned, Sync Center sets the handler's state to the last known value. If the handler's last known value in that situation was inactive, Sync Center disables the <b>Setup</b> task. If the handler's last known value was active, the <b>Delete</b> task is not disabled.
     * 
     * If either the SYNCMGR_HCM_QUERY_BEFORE_ACTIVATE or SYNCMGR_HCM_QUERY_BEFORE_DEACTIVE flag is set in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">GetCapabilities</a>, the handler must manage its own activation state and therefore must return either S_OK or S_FALSE. Any other return value will be considered an error.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isactive
     */
    IsActive() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the handler is enabled.
     * @remarks
     * If a handler is disabled, neither it nor any of its items will be synchronized by Sync Center. Also, many of the possible actions available to a handler—such as Sync—are removed or disabled in the Sync Center folder UI.
     * 
     * This value is available in the folder UI as the System.Sync.Enabled (PKEY_Sync_Enabled) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the handler is enabled; otherwise, S_FALSE.
     *                     
     *                     
     * 
     * If the handler wants Sync Center to maintain the current state, it can return E_NOTIMPL. If any other value is returned, Sync Center sets the handler's enabled state to the last known value and enables or disables the associated tasks as appropriate.
     * 
     * If either the SYNCMGR_HCM_QUERY_BEFORE_ENABLE or SYNCMGR_HCM_QUERY_BEFORE_DISABLE flag is set in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">GetCapabilities</a>, the handler must manage its own enabled state and therefore must return either S_OK or S_FALSE. Any other return value will be considered an error.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isenabled
     */
    IsEnabled() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the handler�typically some type of external device�is connected.
     * @remarks
     * If a handler is disconnected, neither it nor any of its items will be synchronized by Sync Center. Also, many of the possible actions available to a handler—such as Sync—are removed or disabled in the Sync Center folder UI.
     * 
     * This value is available in the folder UI as the System.Sync.Connected (PKEY_Sync_Connected) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the handler is connected; otherwise, S_FALSE. An error returned by this method will be interpreted as S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isconnected
     */
    IsConnected() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
