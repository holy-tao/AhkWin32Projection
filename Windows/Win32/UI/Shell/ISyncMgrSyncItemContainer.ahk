#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<ISyncMgrSyncItem>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitem
     */
    GetSyncItem(pszItemID, ppItem) {
        pszItemID := pszItemID is String ? StrPtr(pszItemID) : pszItemID

        result := ComCall(3, this, "ptr", pszItemID, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncMgrSyncItems>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitemenumerator
     */
    GetSyncItemEnumerator(ppenum) {
        result := ComCall(4, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitemcount
     */
    GetSyncItemCount(pcItems) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcItemsMarshal, pcItems, "HRESULT")
        return result
    }
}
