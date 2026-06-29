#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpellChecker.ahk" { ISpellChecker }

/**
 * Represents a particular spell checker for a particular language, with the added ability to remove words from the added words dictionary, or from the ignore list.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellchecker2
 * @namespace Windows.Win32.Globalization
 */
export default struct ISpellChecker2 extends ISpellChecker {
    /**
     * The interface identifier for ISpellChecker2
     * @type {Guid}
     */
    static IID := Guid("{e7ed1c71-87f7-4378-a840-c9200dacee47}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpellChecker2 interfaces
    */
    struct Vtbl extends ISpellChecker.Vtbl {
        Remove : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpellChecker2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes a word that was previously added by ISpellChecker.Add, or set by ISpellChecker.Ignore to be ignored.
     * @param {PWSTR} word The word to be removed from the list of added words, or from the list of ignored words. If the word is not present, nothing will be removed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>word</i> is an empty string, or its length is greater than <b>MAX_WORD_LENGTH</b>.
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
     * <i>word</i> is a null pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker2-remove
     */
    Remove(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(17, this, "ptr", word, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpellChecker2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Remove)
    }
}
