#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumFilters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumFilters interface enumerates the filters in a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumfilters
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumFilters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumFilters
     * @type {Guid}
     */
    static IID => Guid("{56a86893-0ad4-11ce-b03a-0020af0ba770}")

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
     * The Next method retrieves the specified number of filters in the enumeration sequence.
     * @param {Integer} cFilters Number of filters to retrieve.
     * @param {Pointer<IBaseFilter>} ppFilter Array of size <i>cFilters</i> that is filled with <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface pointers. The caller must release the interfaces.
     * @param {Pointer<Integer>} pcFetched Receives the number of filters retrieved. Can be <b>NULL</b> if <i>cFilters</i> is 1.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>Did not retrieve as many filters as requested.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Success.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>Invalid argument.</td>
     * </tr>
     * <tr>
     * <td>E_POINTER</td>
     * <td><b>NULL</b> pointer argument.</td>
     * </tr>
     * <tr>
     * <td>VFW_E_ENUM_OUT_OF_SYNC</td>
     * <td>The graph has changed and is now inconsistent with the enumerator.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumfilters-next
     */
    Next(cFilters, ppFilter, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFilters, "ptr*", ppFilter, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * The Skip method skips over a specified number of filters.
     * @param {Integer} cFilters Number of filters to skip.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>Skipped past the end of the sequence.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Success.</td>
     * </tr>
     * <tr>
     * <td>VFW_E_ENUM_OUT_OF_SYNC</td>
     * <td>The graph has changed and is now inconsistent with the enumerator.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator object. The returned object starts with the same enumeration state as the original.
     * @returns {IEnumFilters} Receives a pointer to the <b>IEnumFilters</b> interface of the new enumerator. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumfilters-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumFilters(ppEnum)
    }
}
