#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a standard set of methods that enumerate the pointers to item identifier lists (PIDLs) of the items in a Shell folder.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumfullidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumFullIDList extends IUnknown {
    /**
     * The interface identifier for IEnumFullIDList
     * @type {Guid}
     */
    static IID := Guid("{d0191542-7954-4908-bc06-b2360bbe45ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumFullIDList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumFullIDList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of IDLIST_ABSOLUTE items.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items referenced in the array referenced by the <i>rgelt</i> parameter.
     * @param {Pointer<Pointer<ITEMIDLIST>>} rgelt Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * On success, contains a PIDL array. The implementation must allocate these item identifiers using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The calling application is responsible for freeing the item identifiers using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On success, contains a pointer to a value that receives a count of the absolute item identifiers actually returned in <i>rgelt</i>. The count can be smaller than the value specified in the <i>celt</i> parameter. This parameter can be <b>NULL</b> on entry only if <i>celt</i> is 1, because in that case the method can only retrieve one (S_OK) or zero (S_FALSE) items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the method successfully retrieved the requested <i>celt</i> elements. This method only returns S_OK if the full count of requested items are successfully retrieved.
     *                     
     *                     
     * 
     * S_FALSE indicates that more items were requested than remained in the enumeration. The value pointed to by the <i>pceltFetched</i> parameter specifies the actual number of items retrieved. Note that the value will be 0 if there are no more items to retrieve.
     * 
     * Returns a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-next
     */
    Next(celt, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * Skips a specified number of IDLIST_ABSOLUTE items.
     * @remarks
     * The enumeration index is advanced by the number of items skipped.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of items to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Returns the enumerator to the beginning of the enumeration sequence.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new item enumeration object with the same contents and state as the current one. (IEnumFullIDList.Clone)
     * @returns {IEnumFullIDList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumfullidlist">IEnumFullIDList</a>**</b>
     * 
     * On success, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumfullidlist">IEnumFullIDList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumFullIDList(ppenum)
    }

    Query(iid) {
        if (IEnumFullIDList.IID.Equals(iid)) {
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
