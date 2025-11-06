#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrEnumItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate through an array of SYNCMGRITEM structures.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * If the registered application works with the synchronization manager to synchronize items, it must implement an enumerator object with this interface to enumerate through the items.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * The synchronization manager obtains a pointer to this interface and calls each method during the synchronization process.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/nn-mobsync-isyncmgrenumitems
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrEnumItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrEnumItems
     * @type {Guid}
     */
    static IID => Guid("{6295df2a-35ee-11d1-8707-00c04fd93327}")

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
     * @param {Pointer<SYNCMGRITEM>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrenumitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrenumitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrenumitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISyncMgrEnumItems} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrenumitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return ISyncMgrEnumItems(ppenum)
    }
}
