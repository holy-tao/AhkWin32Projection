#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFsiItem.ahk" { IFsiItem }

/**
 * Use this interface to enumerate the child directory and file items for a FsiDirectoryItem object.
 * @remarks
 * This is a <b>EnumFsiItems</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ienumfsiitems
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IEnumFsiItems extends IUnknown {
    /**
     * The interface identifier for IEnumFsiItems
     * @type {Guid}
     */
    static IID := Guid("{2c941fda-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for EnumFsiItems
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fc6-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumFsiItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumFsiItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of items in the enumeration sequence. (IEnumFsiItems.Next)
     * @remarks
     * If there are fewer than the requested number of elements left in the sequence, it retrieves the remaining elements.
     * @param {Integer} celt Number of items to retrieve.
     * @param {Pointer<IFsiItem>} rgelt Array of <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsiitem">IFsiItem</a> interfaces. You must release each interface in rgelt when done.
     * @param {Pointer<Integer>} pceltFetched Number of elements returned in rgelt. You can set <i>pceltFetched</i> to <b>NULL</b> if <i>celt</i> is one. Otherwise, initialize the value of <i>pceltFetched</i> to 0 before calling this method.
     * @returns {HRESULT} S_OK is returned when the number of requested elements (<i>celt</i>) are returned successfully or the number of returned items (<i>pceltFetched</i>) is less than the number of requested elements.
     * 
     * Other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ienumfsiitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IFsiItem.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of items in the enumeration sequence. (IEnumFsiItems.Skip)
     * @remarks
     * If there are fewer elements left in the sequence than the requested number of elements to skip, it skips past the last element in the sequence.
     * @param {Integer} celt Number of items to skip.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Skipped less than the number of requested elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ienumfsiitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumFsiItems.Reset)
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ienumfsiitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates another enumerator that contains the same enumeration state as the current one. (IEnumFsiItems.Clone)
     * @remarks
     * Using this method, a client can record a particular point in the enumeration sequence, and then return to that point at a later time. The new enumerator supports the same interface as the original one.
     * @returns {IEnumFsiItems} Receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined. You must release <i>ppEnum</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ienumfsiitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumFsiItems(ppEnum)
    }

    Query(iid) {
        if (IEnumFsiItems.IID.Equals(iid)) {
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
