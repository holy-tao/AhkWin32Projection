#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnConfigure interface is implemented by a text service to enable the Text Services control panel application to allow the text service to display a configuration dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnconfigure
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnConfigure extends ITfFunction {
    /**
     * The interface identifier for ITfFnConfigure
     * @type {Guid}
     */
    static IID := Guid("{88f567c6-1757-49f8-a1b2-89234c1eeff9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnConfigure interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnConfigure.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnConfigure::Show method
     * @remarks
     * This method should not return until the user closes the dialog box or property sheet.
     * @param {HWND} hwndParent Handle of the parent window. The text service typically uses this as the parent or owner window when creating a dialog box.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the identifier of the language selected in the Text Services control panel application.
     * @param {Pointer<Guid>} rguidProfile Contains a GUID value that specifies the language profile identifier that the text service is under. This is the value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile">ITfInputProcessorProfiles::AddLanguageProfile</a> when the profile was added.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnconfigure-show
     */
    Show(hwndParent, langid, rguidProfile) {
        result := ComCall(4, this, HWND, hwndParent, "ushort", langid, Guid.Ptr, rguidProfile, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnConfigure.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
    }
}
