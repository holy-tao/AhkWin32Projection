#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TF_LMLATTELEMENT.ahk" { TF_LMLATTELEMENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumTfLatticeElements interface is implemented by the TSF manager to provide an enumeration of lattice elements.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-ienumtflatticeelements
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IEnumTfLatticeElements extends IUnknown {
    /**
     * The interface identifier for IEnumTfLatticeElements
     * @type {Guid}
     */
    static IID := Guid("{56988052-47da-4a05-911a-e3d941f17145}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumTfLatticeElements interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Clone : IntPtr
        Next  : IntPtr
        Reset : IntPtr
        Skip  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumTfLatticeElements.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IEnumTfLatticeElements::Clone method
     * @returns {IEnumTfLatticeElements} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-ienumtflatticeelements">IEnumTfLatticeElements</a> interface pointer that receives the new enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-ienumtflatticeelements-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLatticeElements(ppEnum)
    }

    /**
     * IEnumTfLatticeElements::Next method
     * @param {Integer} ulCount Specifies the number of elements to obtain.
     * @param {Pointer<TF_LMLATTELEMENT>} rgsElements Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/ns-ctffunc-tf_lmlattelement">TF_LMLATTELEMENT</a> structures that receives the requested data. This array must be at least <i>ulCount</i> elements in size.
     * 
     * The caller must free the <b>bstrText</b> member of every structure obtained using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @param {Pointer<Integer>} pcFetched Pointer to a ULONG value that receives the number of elements actually obtained. This value can be less than the number of items requested. This parameter can be <b>NULL</b>.
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
     * <i>rgsElements</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-ienumtflatticeelements-next
     */
    Next(ulCount, rgsElements, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, TF_LMLATTELEMENT.Ptr, rgsElements, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * IEnumTfLatticeElements::Reset method
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
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-ienumtflatticeelements-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IEnumTfLatticeElements::Skip method
     * @param {Integer} ulCount Contains the number of elements to skip.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-ienumtflatticeelements-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumTfLatticeElements.IID.Equals(iid)) {
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
