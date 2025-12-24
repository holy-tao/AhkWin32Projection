#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrSyncItemInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that act on and retrieve information from a single sync item, allowing handlers to manage sync items as independent objects.
 * @remarks
 * 
 * A sync item typically represents a group of data, for example, a folder that contains several files. By representing this sync item as an interface, the item can be easily managed and implemented as an object. That object maintains the state of the item when the item is accessed.
 * 
 * Representing a sync item as <b>ISyncMgrSyncItem</b> also allows support for a sync item that contains other sync items.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsyncitem
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
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the item's ID. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getitemid
     */
    GetItemID() {
        result := ComCall(3, this, "ptr*", &ppszItemID := 0, "HRESULT")
        return ppszItemID
    }

    /**
     * Gets the UI display name of the sync item.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the item's display name. This string is of maximum length MAX_SYNCMGR_NAME including the terminating <b>null</b> character. Longer strings are truncated.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getname
     */
    GetName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets the properties of a sync item.
     * @returns {ISyncMgrSyncItemInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo">ISyncMgrSyncItemInfo</a>*</b>
     * 
     * When this method returns, contains the address of a pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo">ISyncMgrSyncItemInfo</a> interface, representing the item.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getiteminfo
     */
    GetItemInfo() {
        result := ComCall(5, this, "ptr*", &ppItemInfo := 0, "HRESULT")
        return ISyncMgrSyncItemInfo(ppItemInfo)
    }

    /**
     * Creates a specific type of object related to the item.
     * @param {Pointer<Guid>} rguidObjectID Type: <b>REFGUID</b>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This is dependent on the object type named in <i>rguidObjectID</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(6, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a set of flags describing the item's defined capabilities.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities">SYNCMGR_ITEM_CAPABILITIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities">SYNCMGR_ITEM_CAPABILITIES</a> enumeration that defines the capabilities of the item.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(7, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * Gets a set of flags describing the policies set by the item.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_policies">SYNCMGR_ITEM_POLICIES</a>*</b>
     * 
     * When this method returns, contains a pointer to a bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_policies">SYNCMGR_ITEM_POLICIES</a> enumeration that defines the item's policies.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-getpolicies
     */
    GetPolicies() {
        result := ComCall(8, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * Enables or disables the sync item.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Deletes a sync item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsyncitem-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
