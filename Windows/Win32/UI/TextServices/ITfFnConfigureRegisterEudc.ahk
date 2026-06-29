#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnConfigureRegisterEudc interface is implemented by a text service to provide the UI to register the key sequence for the given EUDC.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnconfigureregistereudc
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnConfigureRegisterEudc extends ITfFunction {
    /**
     * The interface identifier for ITfFnConfigureRegisterEudc
     * @type {Guid}
     */
    static IID := Guid("{b5e26ff5-d7ad-4304-913f-21a2ed95a1b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnConfigureRegisterEudc interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnConfigureRegisterEudc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfFnConfigureRegisterEudc::Show method shows the EUDC key sequence register UI.
     * @param {HWND} hwndParent [in] Handle of the parent window. The text service typically uses this as the parent or owner window when creating a dialog box.
     * @param {Integer} langid [in] Contains a LANGID value that specifies the identifier of the language.
     * @param {Pointer<Guid>} rguidProfile [in] Contains a GUID value that specifies the language profile identifier that the text service is under.
     * @param {BSTR} bstrRegistered [in, unique] Contains a BSTR that contains the EUDC to be registered with the text service. This is optional and can be <b>NULL</b>. If <b>NULL</b>, the text service should display a default register EUDC dialog box.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnconfigureregistereudc-show
     */
    Show(hwndParent, langid, rguidProfile, bstrRegistered) {
        bstrRegistered := bstrRegistered is String ? BSTR.Alloc(bstrRegistered).Value : bstrRegistered

        result := ComCall(4, this, HWND, hwndParent, "ushort", langid, Guid.Ptr, rguidProfile, BSTR, bstrRegistered, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnConfigureRegisterEudc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
    }
}
