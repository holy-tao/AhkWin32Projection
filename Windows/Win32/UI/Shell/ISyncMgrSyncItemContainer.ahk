#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrSyncItem.ahk
#Include .\IEnumSyncMgrSyncItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide information to handlers about the items they contain.
 * @remarks
 * 
 * Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a> interface to obtain a pointer to the <b>ISyncMgrSyncItemContainer</b> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsyncitemcontainer
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncItemContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSyncItemContainer
     * @type {Guid}
     */
    static IID => Guid("{90701133-be32-4129-a65c-99e616cafff4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncItem", "GetSyncItemEnumerator", "GetSyncItemCount"]

    /**
     * 
     * @param {PWSTR} pszItemID 
     * @returns {ISyncMgrSyncItem} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitem
     */
    GetSyncItem(pszItemID) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(3, this, "ptr", pszItemID, "ptr*", &ppItem := 0, "HRESULT")
        return ISyncMgrSyncItem(ppItem)
    }

    /**
     * 
     * @returns {IEnumSyncMgrSyncItems} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitemenumerator
     */
    GetSyncItemEnumerator() {
        result := ComCall(4, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrSyncItems(ppenum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitemcount
     */
    GetSyncItemCount() {
        result := ComCall(5, this, "uint*", &pcItems := 0, "HRESULT")
        return pcItems
    }
}
