#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a standard set of methods used to enumerate the pointers to item identifier lists (PIDLs) of the items in a Shell folder.
 * @remarks
 * All Shell folder objects must be able to respond to a call to their <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method by creating an enumeration object that exports <b>IEnumIDList</b>. The Shell, in particular, uses these objects to enumerate the items in a folder.
 * 
 * Use this interface to enumerate the contents of a Shell folder object. Call the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method and use the returned <b>IEnumIDList</b> pointer to enumerate the PIDLs of the items in the folder.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumIDList extends IUnknown {
    /**
     * The interface identifier for IEnumIDList
     * @type {Guid}
     */
    static IID := Guid("{000214f2-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumIDList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumIDList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of item identifiers in the enumeration sequence and advances the current position by the number of items retrieved.
     * @remarks
     * If this method returns a Component Object Model (COM) error code (as determined by the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macro), then no entries in the <i>rgelt</i> array are valid on exit. If this method returns a success code (such as S_OK or S_FALSE), then the <b>ULONG</b> pointed to by the <i>pceltFetched</i> parameter determines how many entries in the <i>rgelt</i> array are valid on exit.
     * 
     * The distinction is important in the case where <i>celt</i> &gt; 1. For example, if you pass <i>celt</i>=10 and there are only 3 elements left, *<i>pceltFetched</i> will be 3 and the method will return S_FALSE meaning that you reached the end of the file. The three fetched elements will be stored into <i>rgelt</i> and are valid.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements in the array referenced by the <i>rgelt</i> parameter.
     * @param {Pointer<Pointer<ITEMIDLIST>>} rgelt Type: <b>LPITEMIDLIST*</b>
     * 
     * The address of a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> pointers that receive the item identifiers. The implementation must allocate these item identifiers using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The calling application is responsible for freeing the item identifiers using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 					
     *                     
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structures returned in the array are relative to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> being enumerated.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to a value that receives a count of the item identifiers actually returned in <i>rgelt</i>. The count can be smaller than the value specified in the <i>celt</i> parameter. This parameter can be <b>NULL</b> on entry only if <i>celt</i> = 1, because in that case the method can only retrieve one (S_OK) or zero (S_FALSE) items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the method successfully retrieved the requested <i>celt</i> elements. This method only returns S_OK if the full count of requested items are successfully retrieved.
     *                     
     *                     
     * 
     * S_FALSE indicates that more items were requested than remained in the enumeration. The value pointed to by the <i>pceltFetched</i> parameter specifies the actual number of items retrieved. Note that the value will be 0 if there are no more items to retrieve.
     * 
     * Returns a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-next
     */
    Next(celt, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * Skips the specified number of elements in the enumeration sequence.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of item identifiers to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, Int32)
        return result
    }

    /**
     * Returns to the beginning of the enumeration sequence.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-reset
     */
    Reset() {
        result := ComCall(5, this, Int32)
        return result
    }

    /**
     * Creates a new item enumeration object with the same contents and state as the current one. (IEnumIDList.Clone)
     * @remarks
     * This method makes it possible to record a particular point in the enumeration sequence and then return to that point at a later time.
     * @returns {IEnumIDList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a>**</b>
     * 
     * The address of a pointer to the new enumeration object. The calling application must eventually free the new object by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> member function.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, Int32)
        return IEnumIDList(ppenum)
    }

    Query(iid) {
        if (IEnumIDList.IID.Equals(iid)) {
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
