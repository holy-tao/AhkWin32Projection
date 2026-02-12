#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumRegFilters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. (IEnumRegFilters)
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ienumregfilters
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumRegFilters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumRegFilters
     * @type {Guid}
     */
    static IID => Guid("{56a868a4-0ad4-11ce-b03a-0020af0ba770}")

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
     * Note  The IEnumRegFilters interface is deprecated. Fills the array with descriptions of the next set of filters (specified by the cFilters parameter) that meet the requirements specified upon creation of the enumerator.
     * @remarks
     * The calling application must use the Microsoft Win32 <b>CoTaskMemFree</b> function to free each <b>REGFILTER</b> pointer returned in the array. Do not free the <b>Name</b> member of the <b>REGFILTER</b> structure separately, because <c>IEnumRegFilters::Next</c> allocates memory for this string as part of the <b>REGFILTER</b> structure.
     * 
     * If the number of registered filters changes, the state of the enumerator will no longer be consistent with the state of the registry. As a result, this method will return VFW_E_ENUM_OUT_OF_SYNC. You should discard any data obtained from previous calls to the enumerator, because it might be invalid, and update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumregfilters-reset">Reset</a> method. You can then call the <c>Next</c> method safely.
     * @param {Integer} cFilters Number of filters.
     * @param {Pointer<Integer>} pcFetched Pointer to the actual number of filters passed.
     * @returns {Pointer<REGFILTER>} Address of a pointer to an array of <b>REGFILTER</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienumregfilters-next
     */
    Next(cFilters, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFilters, "ptr*", &apRegFilter := 0, pcFetchedMarshal, pcFetched, "int")
        return apRegFilter
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. This method is not currently implemented and returns E_NOTIMPL. (IEnumRegFilters.Skip)
     * @param {Integer} cFilters Number of items to skip.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienumregfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. Resets the enumerator so that the next call to the IEnumRegFilters::Next method begins again at the first filter, if any.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienumregfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. This method is not currently implemented and returns E_NOTIMPL. (IEnumRegFilters.Clone)
     * @returns {IEnumRegFilters} Address of a pointer to the duplicate enumerator interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ienumregfilters-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumRegFilters(ppEnum)
    }
}
