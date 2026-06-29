#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfUIElement.ahk" { ITfUIElement }

/**
 * The IEnumTfUIElements interface is implemented by TSF manager and used by applications or textservices. This interface can be retrieved by ITfUIElementMgr::EnumUIElements and enumerates the registered UI elements.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-ienumtfuielements
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IEnumTfUIElements extends IUnknown {
    /**
     * The interface identifier for IEnumTfUIElements
     * @type {Guid}
     */
    static IID := Guid("{887aa91e-acba-4931-84da-3c5208cf543f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumTfUIElements interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Clone : IntPtr
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumTfUIElements.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumTfUIElements::Clone method creates a copy of the enumerator object.
     * @returns {IEnumTfUIElements} [out] A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfuielements">IEnumTfUIElements</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfuielements-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfUIElements(ppEnum)
    }

    /**
     * The IEnumTfUIElements::Next method obtains, from the current position, the specified number of elements in the enumeration sequence.
     * @param {Integer} ulCount [out] Specifies the number of elements to obtain.
     * @param {Pointer<ITfUIElement>} ppElement [out] Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface pointer. This array must be at least <i>ulCount</i> elements in size.
     * @param {Pointer<Integer>} pcFetched [out] Pointer to a ULONG value that receives the number of elements actually obtained. This value can be less than the number of items requested. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The method reached the end of the enumeration before the specified number of elements could be obtained.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfuielements-next
     */
    Next(ulCount, ppElement, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, ITfUIElement.Ptr, ppElement, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumTfUIElements::Reset method resets the enumerator object by moving the current position to the beginning of the enumeration sequence.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfuielements-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumTfUIElements::Skip method obtains, from the current position, the specified number of elements in the enumeration sequence.
     * @param {Integer} ulCount [in] Specifies the number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The method reached the end of the enumeration before the specified number of elements could be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfuielements-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumTfUIElements.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Skip)
    }
}
