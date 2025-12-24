#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumCATEGORYINFO.ahk
#Include .\IUnknown.ahk

/**
 * Enumerates component categories registered in the system.
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-ienumcategoryinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumCATEGORYINFO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCATEGORYINFO
     * @type {Guid}
     */
    static IID => Guid("{0002e011-0000-0000-c000-000000000046}")

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
     * Retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<CATEGORYINFO>} rgelt An array of enumerated items.
     * 
     * The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If <i>celt</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>pceltFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pceltFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-ienumcategoryinfo-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-ienumcategoryinfo-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} The return value is S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-ienumcategoryinfo-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumCATEGORYINFO} A pointer to the cloned enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-ienumcategoryinfo-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCATEGORYINFO(ppenum)
    }
}
