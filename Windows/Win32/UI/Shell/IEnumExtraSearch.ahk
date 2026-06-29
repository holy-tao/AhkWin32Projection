#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXTRASEARCH.ahk" { EXTRASEARCH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A standard OLE enumerator used by a client to determine the available search objects for a folder.
 * @remarks
 * Implement <b>IEnumExtraSearch</b> if your namespace extension supports one or more search objects.
 * 
 * You do not call this interface directly. An <b>IEnumExtraSearch</b> interface is requested by a client only after it has determined that the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> interface is exposed. Clients retrieve a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-enumsearches">IShellFolder2::EnumSearches</a>.
 * 
 * <b>IEnumExtraSearch</b> implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and the standard OLE enumeration methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumExtraSearch extends IUnknown {
    /**
     * The interface identifier for IEnumExtraSearch
     * @type {Guid}
     */
    static IID := Guid("{0e700be1-9db6-11d1-a1ce-00c04fd75d13}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumExtraSearch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumExtraSearch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to request information on one or more search objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of search objects to be enumerated, starting from the current object. If <i>celt</i> is too large, the method should stop and return the actual number of search objects in <i>pceltFetched</i>.
     * @param {Pointer<EXTRASEARCH>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-extrasearch">EXTRASEARCH</a>*</b>
     * 
     * A pointer to an array of <i>pceltFetched</i> <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-extrasearch">EXTRASEARCH</a> structures containing information on the enumerated objects.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * The number of objects actually enumerated. This may be less than <i>celt</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, EXTRASEARCH.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skip a specified number of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Used to reset the enumeration index to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Used to request a duplicate of the enumerator object to preserve its current state.
     * @remarks
     * The new enumerator should be created with the same state as the current one. Use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-skip">IEnumExtraSearch::Skip</a> method to advance the enumeration index to the appropriate value before returning.
     * @returns {IEnumExtraSearch} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a>**</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a> interface of a new enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExtraSearch(ppenum)
    }

    Query(iid) {
        if (IEnumExtraSearch.IID.Equals(iid)) {
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
