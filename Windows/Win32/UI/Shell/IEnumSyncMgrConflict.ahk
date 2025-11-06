#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncMgrConflict.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes conflict enumeration methods.
 * @remarks
 * 
  * A conflict store returns a pointer to an <b>IEnumSyncMgrConflict</b> interface from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-enumconflicts">ISyncMgrConflictStore::EnumConflicts</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-ienumsyncmgrconflict
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumSyncMgrConflict extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncMgrConflict
     * @type {Guid}
     */
    static IID => Guid("{82705914-dda3-4893-ba99-49de6c8c8036}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ISyncMgrConflict>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSyncMgrConflict} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrconflict-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrConflict(ppenum)
    }
}
