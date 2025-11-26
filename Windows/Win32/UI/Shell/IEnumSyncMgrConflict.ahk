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
     * Gets the next batch of conflicts from the conflicts store.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The value must be 1.
     * @param {Pointer<ISyncMgrConflict>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflict">ISyncMgrConflict</a> interface pointer.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of conflicts fetched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrconflict-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips forward the specified number of conflicts in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of conflicts to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrconflict-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current position in the enumeration to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrconflict-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not used. Clones an IEnumSyncMgrConflict object.
     * @returns {IEnumSyncMgrConflict} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict">IEnumSyncMgrConflict</a>**</b>
     * 
     * The address of the cloned <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict">IEnumSyncMgrConflict</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrconflict-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrConflict(ppenum)
    }
}
