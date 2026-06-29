#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide property and state information for a single sync item.
 * @remarks
 * By representing these properties as an interface, the set of properties can be changed later without recompiling the handler. The interface also provides type-safe access to the properties.
 * 
 * Items should always implement this interface, usually on the same object that implements <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSyncItemInfo extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSyncItemInfo
     * @type {Guid}
     */
    static IID := Guid("{e7fd9502-be0c-4464-90a1-2b5277031232}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSyncItemInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTypeLabel    : IntPtr
        GetComment      : IntPtr
        GetLastSyncTime : IntPtr
        IsEnabled       : IntPtr
        IsConnected     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSyncItemInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a label for the item type. This typically provides the model of the device or an equivalent item-specific identity string.
     * @remarks
     * The label value is displayed as the System.Sync.ItemTypeLabel (PKEY_Sync_ItemTypeLabel) property in the folder UI. Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">UpdateItem</a> method is called.
     * 
     * The item is responsible for allocating the string buffer pointed to by <i>ppszTypeLabel</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the label string.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-gettypelabel
     */
    GetTypeLabel() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszTypeLabel := 0, "HRESULT")
        return ppszTypeLabel
    }

    /**
     * Gets a string that contains commentary regarding the item.
     * @remarks
     * This string could be provided by an item to display a summary of its contents, for example, "32 contacts" or "13 songs". The string can have a maximum length of MAX_SYNCMGR_NAME including the terminating null character.
     * 
     * The comment value is displayed as the System.Sync.Comments (PKEY_Sync_Comments) property in the folder UI when a synchronization is not being performed.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * 
     * The item is responsible for allocating the string buffer pointed to by <i>ppszComment</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the comment string. This string is of maximum length MAX_SYNCMGR_NAME including the terminating null character.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getcomment
     */
    GetComment() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszComment := 0, "HRESULT")
        return ppszComment
    }

    /**
     * Gets the date and time when the item was last synchronized.
     * @remarks
     * This value is not displayed in the folder UI by default, but is available as the System.Sync.DateSynchronized (PKEY_Sync_DateSynchronized) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">UpdateItem</a> method is called.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time information.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getlastsynctime
     */
    GetLastSyncTime() {
        pftLastSync := FILETIME()
        result := ComCall(5, this, FILETIME.Ptr, pftLastSync, "HRESULT")
        return pftLastSync
    }

    /**
     * Generates a value that indicates whether the item is enabled.
     * @remarks
     * If an item is disabled, it is not synchronized by Sync Center. Also, many of the possible actions available to an item—such as Sync—are removed or disabled in the UI.
     * 
     * An item can implement a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-isconnected">Disconnected</a> state by returning S_FALSE from <b>IsEnabled</b> and setting the SYNCMR_IPM_PREVENT_ENABLE flag in its <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getpolicies">GetPolicies</a> implementation. This shows the item as disabled and prevents the user from enabling it manually.
     * 
     * The enabled value is available in the folder UI as the System.Sync.Enabled (PKEY_Sync_Enabled) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item is enabled; otherwise, S_FALSE.
     *                     
     *                     
     * 
     * If the item wants Sync Center to maintain the current state, it can return E_NOTIMPL. If any other value is returned, Sync Center sets the item's enabled state to the last known value and enables or disables the associated tasks as appropriate.
     * 
     * If either the SYNCMGR_ICM_QUERY_BEFORE_ENABLE or SYNCMGR_ICM_QUERY_BEFORE_DISABLE flags are set in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">GetCapabilities</a>, the handler must manage its own enabled state and therefore must return either S_OK or S_FALSE. Any other return value will be considered an error.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-isenabled
     */
    IsEnabled() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Generates a value that indicates whether the item�typically some type of external device�is connected.
     * @remarks
     * If an item is disconnected, it is not synchronized by Sync Center. Also, many of the possible actions available to a item—such as Sync—are removed or disabled in the UI.
     * 
     * This value is available in the folder UI as the System.Sync.Connected (PKEY_Sync_Connected) property.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">UpdateHandler</a> method is called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item is connected; otherwise, S_FALSE. An error returned by this method will be interpreted as S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, Int32)
        return result
    }

    Query(iid) {
        if (ISyncMgrSyncItemInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTypeLabel := CallbackCreate(GetMethod(implObj, "GetTypeLabel"), flags, 2)
        this.vtbl.GetComment := CallbackCreate(GetMethod(implObj, "GetComment"), flags, 2)
        this.vtbl.GetLastSyncTime := CallbackCreate(GetMethod(implObj, "GetLastSyncTime"), flags, 2)
        this.vtbl.IsEnabled := CallbackCreate(GetMethod(implObj, "IsEnabled"), flags, 1)
        this.vtbl.IsConnected := CallbackCreate(GetMethod(implObj, "IsConnected"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTypeLabel)
        CallbackFree(this.vtbl.GetComment)
        CallbackFree(this.vtbl.GetLastSyncTime)
        CallbackFree(this.vtbl.IsEnabled)
        CallbackFree(this.vtbl.IsConnected)
    }
}
