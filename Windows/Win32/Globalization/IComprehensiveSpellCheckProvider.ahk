#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumSpellingError.ahk" { IEnumSpellingError }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows the provider to optionally support a more comprehensive spell checking functionality.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider
 * @namespace Windows.Win32.Globalization
 */
export default struct IComprehensiveSpellCheckProvider extends IUnknown {
    /**
     * The interface identifier for IComprehensiveSpellCheckProvider
     * @type {Guid}
     */
    static IID := Guid("{0c58f8de-8e94-479e-9717-70c42c4ad2c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComprehensiveSpellCheckProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ComprehensiveCheck : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComprehensiveSpellCheckProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Spell-check the provider text in a more thorough manner than ISpellCheckProvider::Check.
     * @remarks
     * This interface isn't required to be implemented by a spell check provider. But if the provider supports two "modes" of spell checking (a faster one and a slower but more thorough one), it should implement this interface in the same object that implements [**ISpellCheckProvider**](/windows/desktop/api/Spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider) to support the more thorough checking mode. When a client calls [**ISpellChecker::ComprehensiveCheck**](/windows/desktop/api/Spellcheck/nf-spellcheck-ispellchecker-comprehensivecheck), the spell checking functionality will [**QueryInterface**](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) the provider for [**IComprehensiveSpellCheckProvider**](/windows/desktop/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider), and call **IComprehensiveSpellCheckProvider.ComprehensiveCheck** if the interface is supported. If the interface isn't supported, it will silently fall back to [**ISpellCheckProvider::Check**](/windows/desktop/api/Spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-check).
     * @param {PWSTR} text The text to check.
     * @returns {IEnumSpellingError} 
     * @see https://learn.microsoft.com/windows/win32/Intl/icomprehensivespellcheckprovider-comprehensivecheck
     */
    ComprehensiveCheck(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(3, this, "ptr", text, "ptr*", &value := 0, "HRESULT")
        return IEnumSpellingError(value)
    }

    Query(iid) {
        if (IComprehensiveSpellCheckProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ComprehensiveCheck := CallbackCreate(GetMethod(implObj, "ComprehensiveCheck"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ComprehensiveCheck)
    }
}
