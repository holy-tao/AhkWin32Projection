#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncMgrEnumItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate through an array of SYNCMGRITEM structures.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * If the registered application works with the synchronization manager to synchronize items, it must implement an enumerator object with this interface to enumerate through the items.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * The synchronization manager obtains a pointer to this interface and calls each method during the synchronization process.
 * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nn-mobsync-isyncmgrenumitems
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
     * Enumerates the next celt elements in the enumerator's list, returning them in rgelt along with the actual number of enumerated elements in pceltFetched.
     * @remarks
     * E_NOTIMPL is not allowed as a return value. If an error value is returned, no entries in the <i>rgelt</i> array are valid on exit and require no release.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items in the array.
     * @param {Pointer<SYNCMGRITEM>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgritem">SYNCMGRITEM</a>*</b>
     * 
     * The address of array containing items.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * The address of variable containing actual number of items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrenumitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Instructs the enumerator to skip the next celt elements in the enumeration so that the next call to ISyncMgrEnumItems::Next does not return those elements.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrenumitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Instructs the enumerator to position itself at the beginning of the list of elements.
     * @remarks
     * There is no guarantee that the same set of elements are enumerated on each pass through the list, nor are the elements necessarily enumerated in the same order. The exact behavior depends on the collection being enumerated. The operation is too memory-intensive for some collections, such as files in a directory, to maintain a specific state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return S_OK if the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrenumitems-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates another items enumerator with the same state as the current enumerator to iterate over the same list. This method makes it possible to record a point in the enumeration sequence in order to return to that point at a later time.
     * @remarks
     * The calling application must release the new enumerator separately from the first enumerator.
     * @returns {ISyncMgrEnumItems} Type: <b>ppenum**</b>
     * 
     * The address of a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrenumitems">ISyncMgrEnumItems</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/mobsync/nf-mobsync-isyncmgrenumitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyncMgrEnumItems(ppenum)
    }
}
