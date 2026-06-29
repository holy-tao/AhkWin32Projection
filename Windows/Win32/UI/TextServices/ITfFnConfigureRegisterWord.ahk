#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnConfigureRegisterWord interface is implemented by a text service to enable the Active Input Method Editor (IME) to cause the text service to display a word registration dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnconfigureregisterword
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnConfigureRegisterWord extends ITfFunction {
    /**
     * The interface identifier for ITfFnConfigureRegisterWord
     * @type {Guid}
     */
    static IID := Guid("{bb95808a-6d8f-4bca-8400-5390b586aedf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnConfigureRegisterWord interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnConfigureRegisterWord.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnConfigureRegisterWord::Show method
     * @param {HWND} hwndParent Handle of the parent window. The text service typically uses this as the parent or owner window when creating the dialog box.
     * @param {Integer} langid Contains a <b>LANGID</b> that specifies the identifier of the language currently used by the Input Method Editor (IME).
     * @param {Pointer<Guid>} rguidProfile Contains a GUID that specifies the language profile identifier that the text service is under. This is the value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile">ITfInputProcessorProfiles::AddLanguageProfile</a> when the profile was added.
     * @param {BSTR} bstrRegistered Contains a <b>BSTR</b> that contains the word to be registered with the text service. This is optional and can be NULL. If NULL, the text service should display a default register word dialog box.
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
     * The text service does not implement this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnconfigureregisterword-show
     */
    Show(hwndParent, langid, rguidProfile, bstrRegistered) {
        bstrRegistered := bstrRegistered is String ? BSTR.Alloc(bstrRegistered).Value : bstrRegistered

        result := ComCall(4, this, HWND, hwndParent, "ushort", langid, Guid.Ptr, rguidProfile, BSTR, bstrRegistered, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnConfigureRegisterWord.IID.Equals(iid)) {
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
