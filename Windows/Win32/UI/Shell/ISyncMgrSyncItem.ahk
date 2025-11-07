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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getitemid
     */
    GetItemID() {
        result := ComCall(3, this, "ptr*", &ppszItemID := 0, "HRESULT")
        return ppszItemID
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getname
     */
    GetName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {ISyncMgrSyncItemInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getiteminfo
     */
    GetItemInfo() {
        result := ComCall(5, this, "ptr*", &ppItemInfo := 0, "HRESULT")
        return ISyncMgrSyncItemInfo(ppItemInfo)
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} rguidObjectID 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(rguidObjectID, riid) {
        result := ComCall(6, this, "ptr", rguidObjectID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(7, this, "int*", &pmCapabilities := 0, "HRESULT")
        return pmCapabilities
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getpolicies
     */
    GetPolicies() {
        result := ComCall(8, this, "int*", &pmPolicies := 0, "HRESULT")
        return pmPolicies
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-enable
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
