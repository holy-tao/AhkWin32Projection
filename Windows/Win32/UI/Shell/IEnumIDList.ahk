#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumIDList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a standard set of methods used to enumerate the pointers to item identifier lists (PIDLs) of the items in a Shell folder.
 * @remarks
 * 
 * All Shell folder objects must be able to respond to a call to their <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method by creating an enumeration object that exports <b>IEnumIDList</b>. The Shell, in particular, uses these objects to enumerate the items in a folder.
 * 
 * Use this interface to enumerate the contents of a Shell folder object. Call the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method and use the returned <b>IEnumIDList</b> pointer to enumerate the PIDLs of the items in the folder.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumIDList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumIDList
     * @type {Guid}
     */
    static IID => Guid("{000214f2-0000-0000-c000-000000000046}")

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
     * Retrieves the specified number of item identifiers in the enumeration sequence and advances the current position by the number of items retrieved.
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumidlist-next
     */
    Next(celt, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, "int")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumidlist-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * Returns to the beginning of the enumeration sequence.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumidlist-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Creates a new item enumeration object with the same contents and state as the current one.
     * @returns {IEnumIDList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a>**</b>
     * 
     * The address of a pointer to the new enumeration object. The calling application must eventually free the new object by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> member function.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumidlist-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "int")
        return IEnumIDList(ppenum)
    }
}
