#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITfCompartment interface is implemented by the TSF manager and is used by clients (applications and text services) to obtain and set data in a TSF compartment.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcompartment
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCompartment extends IUnknown {
    /**
     * The interface identifier for ITfCompartment
     * @type {Guid}
     */
    static IID := Guid("{bb08f7a9-607a-4384-8623-056892b64371}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCompartment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetValue : IntPtr
        GetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCompartment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCompartment::SetValue method
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client.
     * @param {Pointer<VARIANT>} pvarValue Pointer to a VARIANT structure that contains the data to be set. Only VT_I4, VT_UNKNOWN and VT_BSTR data types are allowed.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * <i>pvarValue</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compartment was cleared by a call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcompartmentmgr-clearcompartment">ITfCompartmentMgr::ClearCompartment</a>, this method was called during a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcompartmenteventsink-onchange">ITfCompartmentEventSink::OnChange</a> notification or only the owner can clear this compartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartment-setvalue
     */
    SetValue(tid, pvarValue) {
        result := ComCall(3, this, "uint", tid, VARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    /**
     * ITfCompartment::GetValue method
     * @remarks
     * The caller must recognize the supplied data format in order to use the data. The compartment installer must publish the data format to enable other clients to use it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> structure that receives the data. This receives VT_EMPTY if the compartment has no value. The caller must free this data when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartment-getvalue
     */
    GetValue() {
        pvarValue := VARIANT()
        result := ComCall(4, this, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    Query(iid) {
        if (ITfCompartment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.GetValue)
    }
}
