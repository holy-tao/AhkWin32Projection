#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\ISpellingError.ahk" { ISpellingError }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An enumeration of the spelling errors.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ienumspellingerror
 * @namespace Windows.Win32.Globalization
 */
export default struct IEnumSpellingError extends IUnknown {
    /**
     * The interface identifier for IEnumSpellingError
     * @type {Guid}
     */
    static IID := Guid("{803e3bd4-2828-4410-8290-418d1d73c762}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSpellingError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSpellingError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next spelling error.
     * @remarks
     * If there are no spelling errors, this will return <b>S_FALSE</b>.
     * This provides a way for a provider to implement spell checking lazily if desired—instead of doing the spell checking work on <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-check">ISpellCheckProvider::Check</a> and getting all the errors at once, you can do it only as needed when this method is called, getting one error per call.
     * @returns {ISpellingError} The spelling error (<a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ispellingerror">ISpellingError</a>) returned.
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ienumspellingerror-next
     */
    Next() {
        result := ComCall(3, this, "ptr*", &value := 0, Int32)
        return ISpellingError(value)
    }

    Query(iid) {
        if (IEnumSpellingError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
    }
}
