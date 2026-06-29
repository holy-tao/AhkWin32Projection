#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CORRECTIVE_ACTION.ahk" { CORRECTIVE_ACTION }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\System\Com\Apis.ahk" { CoTaskMemFree }

/**
 * Provides information about a spelling error.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellingerror
 * @namespace Windows.Win32.Globalization
 */
export default struct ISpellingError extends IUnknown {
    /**
     * The interface identifier for ISpellingError
     * @type {Guid}
     */
    static IID := Guid("{b7c82d61-fbe8-4b47-9b27-6c0d2e0de0a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpellingError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_StartIndex       : IntPtr
        get_Length           : IntPtr
        get_CorrectiveAction : IntPtr
        get_Replacement      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpellingError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    StartIndex {
        get => this.get_StartIndex()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {CORRECTIVE_ACTION} 
     */
    CorrectiveAction {
        get => this.get_CorrectiveAction()
    }

    /**
     * @type {PWSTR} 
     */
    Replacement {
        get => this.get_Replacement()
    }

    /**
     * Gets the position in the checked text where the error begins.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_startindex
     */
    get_StartIndex() {
        result := ComCall(3, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the length of the erroneous text.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_length
     */
    get_Length() {
        result := ComCall(4, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Indicates which corrective action should be taken for the spelling error.
     * @returns {CORRECTIVE_ACTION} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_correctiveaction
     */
    get_CorrectiveAction() {
        result := ComCall(5, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the text to use as replacement text when the corrective action is replace.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/ne-spellcheck-corrective_action">CORRECTIVE_ACTION</a> returned by <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellingerror-get_correctiveaction">CorrectiveAction</a> is not <b>CORRECTIVE_ACTION_REPLACE</b>, <i>value</i> is the empty string.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellingerror-get_replacement
     */
    get_Replacement() {
        result := ComCall(6, this, PWSTR.Ptr, &value := 0, Int32)
        if(result != 0) {
            CoTaskMemFree(value.value)
            throw OSError()
        }

        return value
    }

    Query(iid) {
        if (ISpellingError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartIndex := CallbackCreate(GetMethod(implObj, "get_StartIndex"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.get_CorrectiveAction := CallbackCreate(GetMethod(implObj, "get_CorrectiveAction"), flags, 2)
        this.vtbl.get_Replacement := CallbackCreate(GetMethod(implObj, "get_Replacement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartIndex)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.get_CorrectiveAction)
        CallbackFree(this.vtbl.get_Replacement)
    }
}
