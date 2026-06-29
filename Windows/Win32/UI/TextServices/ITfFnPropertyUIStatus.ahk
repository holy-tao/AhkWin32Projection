#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnPropertyUIStatus interface is implemented by a text service and used by an application or text service to obtain and set the status of the text service property UI.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnpropertyuistatus
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnPropertyUIStatus extends ITfFunction {
    /**
     * The interface identifier for ITfFnPropertyUIStatus
     * @type {Guid}
     */
    static IID := Guid("{2338ac6e-2b9d-44c0-a75e-ee64f256b3bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnPropertyUIStatus interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        GetStatus : IntPtr
        SetStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnPropertyUIStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnPropertyUIStatus::GetStatus method
     * @param {Pointer<Guid>} refguidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property</a> identifiers.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the property UI status. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROPUI_STATUS_SAVETOFILE"></a><a id="tf_propui_status_savetofile"></a><dl>
     * <dt><b>TF_PROPUI_STATUS_SAVETOFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property can be serialized. If this value is not present, the property cannot be serialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-getstatus
     */
    GetStatus(refguidProp) {
        result := ComCall(4, this, Guid.Ptr, refguidProp, "uint*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * ITfFnPropertyUIStatus::SetStatus method
     * @param {Pointer<Guid>} refguidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property</a> identifiers.
     * @param {Integer} dw Contains the new property UI status. See the <i>pdw</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-getstatus">ITfFnPropertyUIStatus::GetStatus</a> for possible values.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text service does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-setstatus
     */
    SetStatus(refguidProp, dw) {
        result := ComCall(5, this, Guid.Ptr, refguidProp, "uint", dw, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnPropertyUIStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 3)
        this.vtbl.SetStatus := CallbackCreate(GetMethod(implObj, "SetStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.SetStatus)
    }
}
