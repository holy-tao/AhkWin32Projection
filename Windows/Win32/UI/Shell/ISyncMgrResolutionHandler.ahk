#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manage synchronizing conflicts. Implement this interface to construct a sync conflict handler. The conflict resolution user interface (UI) will call this interface to resolve the conflict presented to the user.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrresolutionhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrResolutionHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrResolutionHandler
     * @type {Guid}
     */
    static IID => Guid("{40a3d052-8bff-4c4b-a338-d4a395700de9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryAbilities", "KeepOther", "KeepRecent", "RemoveFromSyncSet", "KeepItems"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-queryabilities
     */
    QueryAbilities() {
        result := ComCall(3, this, "uint*", &pdwAbilities := 0, "HRESULT")
        return pdwAbilities
    }

    /**
     * 
     * @param {IShellItem} psiOther 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepother
     */
    KeepOther(psiOther) {
        result := ComCall(4, this, "ptr", psiOther, "int*", &pFeedback := 0, "HRESULT")
        return pFeedback
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keeprecent
     */
    KeepRecent() {
        result := ComCall(5, this, "int*", &pFeedback := 0, "HRESULT")
        return pFeedback
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-removefromsyncset
     */
    RemoveFromSyncSet() {
        result := ComCall(6, this, "int*", &pFeedback := 0, "HRESULT")
        return pFeedback
    }

    /**
     * 
     * @param {ISyncMgrConflictResolutionItems} pArray 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepitems
     */
    KeepItems(pArray) {
        result := ComCall(7, this, "ptr", pArray, "int*", &pFeedback := 0, "HRESULT")
        return pFeedback
    }
}
