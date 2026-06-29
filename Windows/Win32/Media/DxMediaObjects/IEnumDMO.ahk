#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumDMO interface provides methods for enumerating Microsoft DirectX Media Objects (DMOs). It is based on the OLE enumeration interfaces. For more information, see the IEnumXXXX topic in the Platform SDK.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nn-mediaobj-ienumdmo
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct IEnumDMO extends IUnknown {
    /**
     * The interface identifier for IEnumDMO
     * @type {Guid}
     */
    static IID := Guid("{2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDMO interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDMO.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves a specified number of items in the enumeration sequence.
     * @remarks
     * If the method succeeds, the arrays given by the <i>pCLSID</i> and <i>Names</i> parameters are filled with CLSIDs and wide-character strings. The value of *<i>pcItemsFetched</i> specifies the number of items returned in these arrays.
     * 
     * The method returns S_OK if it retrieves the requested number of items (in other words, if *<i>pcItemsFetched</i> equals <i>cItemsToFetch</i>). Otherwise, it returns S_FALSE or an error code.
     * 
     * The caller must free the memory allocated for each string returned in the <i>Names</i> parameter, using the <b>CoTaskMemFree</b> function.
     * @param {Integer} cItemsToFetch Number of items to retrieve.
     * @param {Pointer<Guid>} pCLSID Array of size <i>cItemsToFetch</i> that is filled with the CLSIDs of the enumerated DMOs.
     * @param {Pointer<PWSTR>} Names Array of size <i>cItemsToFetch</i> that is filled with the friendly names of the enumerated DMOs.
     * @param {Pointer<Integer>} pcItemsFetched Pointer to a variable that receives the actual number of items retrieved. Can be <b>NULL</b> if <i>cItemsToFetch</i> equals 1.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieved fewer items than requested.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieved the requested number of items.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-next
     */
    Next(cItemsToFetch, pCLSID, Names, pcItemsFetched) {
        NamesMarshal := Names is VarRef ? "ptr*" : "ptr"
        pcItemsFetchedMarshal := pcItemsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cItemsToFetch, Guid.Ptr, pCLSID, NamesMarshal, Names, pcItemsFetchedMarshal, pcItemsFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over a specified number of items in the enumeration sequence.
     * @param {Integer} cItemsToSkip Number of items to skip.
     * @returns {HRESULT} Returns S_OK if the number items skipped equals <i>cItemsToSkip</i>. Otherwise, returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-skip
     */
    Skip(cItemsToSkip) {
        result := ComCall(4, this, "uint", cItemsToSkip, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @returns {IEnumDMO} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDMO(ppEnum)
    }

    Query(iid) {
        if (IEnumDMO.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 5)
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
