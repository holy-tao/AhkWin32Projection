#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\REGFILTER.ahk" { REGFILTER }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. (IEnumRegFilters)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ienumregfilters
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IEnumRegFilters extends IUnknown {
    /**
     * The interface identifier for IEnumRegFilters
     * @type {Guid}
     */
    static IID := Guid("{56a868a4-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumRegFilters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumRegFilters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. Fills the array with descriptions of the next set of filters (specified by the cFilters parameter) that meet the requirements specified upon creation of the enumerator.
     * @remarks
     * The calling application must use the Microsoft Win32 <b>CoTaskMemFree</b> function to free each <b>REGFILTER</b> pointer returned in the array. Do not free the <b>Name</b> member of the <b>REGFILTER</b> structure separately, because <c>IEnumRegFilters::Next</c> allocates memory for this string as part of the <b>REGFILTER</b> structure.
     * 
     * If the number of registered filters changes, the state of the enumerator will no longer be consistent with the state of the registry. As a result, this method will return VFW_E_ENUM_OUT_OF_SYNC. You should discard any data obtained from previous calls to the enumerator, because it might be invalid, and update the enumerator by calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ienumregfilters-reset">Reset</a> method. You can then call the <c>Next</c> method safely.
     * @param {Integer} cFilters Number of filters.
     * @param {Pointer<Integer>} pcFetched Pointer to the actual number of filters passed.
     * @returns {Pointer<REGFILTER>} Address of a pointer to an array of <b>REGFILTER</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-next
     */
    Next(cFilters, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFilters, "ptr*", &apRegFilter := 0, pcFetchedMarshal, pcFetched, Int32)
        return apRegFilter
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. This method is not currently implemented and returns E_NOTIMPL. (IEnumRegFilters.Skip)
     * @param {Integer} cFilters Number of items to skip.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "HRESULT")
        return result
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. Resets the enumerator so that the next call to the IEnumRegFilters::Next method begins again at the first filter, if any.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Note  The IEnumRegFilters interface is deprecated. This method is not currently implemented and returns E_NOTIMPL. (IEnumRegFilters.Clone)
     * @returns {IEnumRegFilters} Address of a pointer to the duplicate enumerator interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumRegFilters(ppEnum)
    }

    Query(iid) {
        if (IEnumRegFilters.IID.Equals(iid)) {
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
