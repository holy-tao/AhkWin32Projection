#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrSyncItemInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that act on and retrieve information from a single sync item, allowing handlers to manage sync items as independent objects.
 * @remarks
 * A sync item typically represents a group of data, for example, a folder that contains several files. By representing this sync item as an interface, the item can be easily managed and implemented as an object. That object maintains the state of the item when the item is accessed.
 * 
 * Representing a sync item as <b>ISyncMgrSyncItem</b> also allows support for a sync item that contains other sync items.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsyncitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSyncItem
     * @type {Guid}
     */
    static IID => Guid("{b20b24ce-2593-4f04-bd8b-7ad6c45051cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemID", "GetName", "GetItemInfo", "GetObject", "GetCapabilities", "GetPolicies", "Enable", "Delete"]

    /**
     * Gets the unique ID of a sync item.
     * @remarks
     * The ID retrieved by this method cannot change. Typically, the ID is in the form of a GUID string. However, this is not a requirement. The ID can be any string that is unique in the context of the handler.
     * 
     * If <b>GetItemID</b> fails or an empty string is returned in <i>ppszItemID</i>, the sync item is not shown in the handler's folder and Sync Center will not attempt to synchronize it.
     * 
     * The ID retrieved by this method is available in the folder UI as the System.Sync.ItemID (PKEY_Sync_HandlerID) property.
     * 
     * The item is responsible for allocating the string buffer pointed to by <i>ppszComment</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * In older Sync Manager implementations, this data was retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgritem">SYNCMGRITEM</a> structure.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the item's ID. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getitemid
     */
    GetItemID() {
        result := ComCall(3, this, "ptr*", &ppszItemID := 0, "HRESULT")
        return ppszItemID
    }

    /**
     * Gets the UI display name of the sync item.
     * @remarks
     * If <b>GetName</b> fails or an empty string is returned in <i>ppszItemID</i>, the sync item is not shown in the handler's folder and Sync Center will not attempt to synchronize it.
     * 
     * The ID retrieved by this method is available in the handler's folder UI as the System.DisplayName (PKEY_DisplayName) property.
     * 
     * The item is responsible for allocating the string buffer pointed to by <i>ppszComment</i> through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Sync Center deallocates the string buffer through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * Sync Center calls this method whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">UpdateItem</a> method is called.
     * 
     * In older Sync Manager implementations, this information was retrieved through the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrhandlerinfo">SYNCMGRHANDLERINFO</a> structure.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the item's display name. This string is of maximum length MAX_SYNCMGR_NAME including the terminating <b>null</b> character. Longer strings are truncated.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getname
     */
    GetName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the properties of a sync item.
     * @remarks
     * If <b>GetItemInfo</b> fails, the sync item is still shown in the handler's folder and Sync Center continues to synchronize it, but default values are used for all properties.
     * @returns {ISyncMgrSyncItemInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo">ISyncMgrSyncItemInfo</a>*</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo">ISyncMgrSyncItemInfo</a> interface, representing the item.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getiteminfo
     */
    GetItemInfo() {
        result := ComCall(5, this, "ptr*", &ppItemInfo := 0, "HRESULT")
        return ISyncMgrSyncItemInfo(ppItemInfo)
    }

    /**
     * Creates a specific type of object related to the item.
     * @remarks
     * The item can implement the requested interface on its handler or it can implement it on a different object.
     * @param {Pointer<Guid>} rguidObjectID Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This is dependent on the object type named in <i>rguidObjectID</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(6, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a set of flags describing the item's defined capabilities.
     * @remarks
     * This method is called by Sync Center in response to a call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">UpdateItem</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities">SYNCMGR_ITEM_CAPABILITIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities">SYNCMGR_ITEM_CAPABILITIES</a> enumeration that defines the capabilities of the item.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(7, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * Gets a set of flags describing the policies set by the item.
     * @remarks
     * A policy is an action that is typically supported but can be disabled by a group policy.
     * 
     * This method is called by Sync Center in response to a call to <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">UpdateItem</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_policies">SYNCMGR_ITEM_POLICIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_policies">SYNCMGR_ITEM_POLICIES</a> enumeration that defines the item's policies.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getpolicies
     */
    GetPolicies() {
        result := ComCall(8, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * Enables or disables the sync item.
     * @remarks
     * Sync Center calls this method in the following scenarios.
     *             
     *                 
     * 
     * <ul>
     * <li>When the user selects the item in the handler's folder and launches its <b>Enable</b> task, but only if the item has not set the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_IPM_PREVENT_ENABLE</a> flag. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">SYNCMGR_OBJECTID_QueryBeforeEnable</a> object, this method is only called if the UI operation was successful.</li>
     * <li>When the user selects the item in the handler's folder and launches its <b>Disable</b> task, but only if the item has not set the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_IPM_PREVENT_DISABLE</a> flag. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">SYNCMGR_OBJECTID_QueryBeforeDisable</a> object, this method is only called if the UI operation was successful.</li>
     * </ul>
     * If the handler does not need to perform any actions when it is activated, it can return either S_OK or E_NOTIMPL as shown in the example below.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Deletes a sync item.
     * @remarks
     * Sync Center calls this method when the user selects the item in the handler's folder and launches its <b>Delete</b> task, but only if the item has set the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_ICM_CAN_DELETE</a> flag. If the handler supports the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">SYNCMGR_OBJECTID_QueryBeforeDeactivate</a> object, this method is only called if the UI operation was successful.
     * 
     * If the handler does not need to perform any actions when it is activated, it can return either S_OK or E_NOTIMPL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
