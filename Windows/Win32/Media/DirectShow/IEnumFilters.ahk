#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumFilters interface enumerates the filters in a filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ienumfilters
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IEnumFilters extends IUnknown {
    /**
     * The interface identifier for IEnumFilters
     * @type {Guid}
     */
    static IID := Guid("{56a86893-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumFilters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumFilters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the specified number of filters in the enumeration sequence.
     * @remarks
     * If the method succeeds, the <b>IBaseFilter</b> pointers all have outstanding reference counts. Be sure to release them when you are done.
     * 
     * If the filter graph changes (for example, the application removes a filter), the enumerator is no longer be consistent with the graph, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumfilters-reset">IEnumFilters::Reset</a> method. You can then call the <c>Next</c> method safely.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-next
     */
    Next(cFilters, ppFilter, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFilters, IBaseFilter.Ptr, ppFilter, pcFetchedMarshal, pcFetched, Int32)
        return result
    }

    /**
     * The Skip method skips over a specified number of filters.
     * @remarks
     * If the filter graph changes (for example, the application removes a filter), the enumerator is no longer be consistent with the graph, and the method returns VFW_E_ENUM_OUT_OF_SYNC. Discard any data obtained from previous calls to the enumerator, because it might be invalid. Update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumfilters-reset">IEnumFilters::Reset</a> method. You can then call the <c>Skip</c> method safely.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. (IEnumFilters.Reset)
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator object. The returned object starts with the same enumeration state as the original.
     * @returns {IEnumFilters} Receives a pointer to the <b>IEnumFilters</b> interface of the new enumerator. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumFilters(ppEnum)
    }

    Query(iid) {
        if (IEnumFilters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
