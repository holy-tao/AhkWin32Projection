#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PWSTR>} ppszItemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getitemid
     */
    GetItemID(ppszItemID) {
        result := ComCall(3, this, "ptr", ppszItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getname
     */
    GetName(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrSyncItemInfo>} ppItemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getiteminfo
     */
    GetItemInfo(ppItemInfo) {
        result := ComCall(5, this, "ptr*", ppItemInfo, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} rguidObjectID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(rguidObjectID, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", rguidObjectID, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities
     */
    GetCapabilities(pmCapabilities) {
        pmCapabilitiesMarshal := pmCapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pmCapabilitiesMarshal, pmCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmPolicies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getpolicies
     */
    GetPolicies(pmPolicies) {
        pmPoliciesMarshal := pmPolicies is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pmPoliciesMarshal, pmPolicies, "HRESULT")
        return result
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
