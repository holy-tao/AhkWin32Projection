#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that gets the conflict ID list for a conflict object.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrConflictFolder
     * @type {Guid}
     */
    static IID => Guid("{59287f5e-bc81-4fca-a7f1-e5a8ecdb1d69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConflictIDList"]

    /**
     * 
     * @param {ISyncMgrConflict} pConflict 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlConflict 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictfolder-getconflictidlist
     */
    GetConflictIDList(pConflict, ppidlConflict) {
        ppidlConflictMarshal := ppidlConflict is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pConflict, ppidlConflictMarshal, ppidlConflict, "HRESULT")
        return result
    }
}
