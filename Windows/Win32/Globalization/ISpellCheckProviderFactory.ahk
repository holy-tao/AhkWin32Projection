#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\System\Com\IEnumString.ahk" { IEnumString }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpellCheckProvider.ahk" { ISpellCheckProvider }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A factory for instantiating a spell checker (ISpellCheckProvider) as well as providing functionality for determining which languages are supported.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-ispellcheckproviderfactory
 * @namespace Windows.Win32.Globalization
 */
export default struct ISpellCheckProviderFactory extends IUnknown {
    /**
     * The interface identifier for ISpellCheckProviderFactory
     * @type {Guid}
     */
    static IID := Guid("{9f671e11-77d6-4c92-aefb-615215e3a4be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpellCheckProviderFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SupportedLanguages   : IntPtr
        IsSupported              : IntPtr
        CreateSpellCheckProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpellCheckProviderFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IEnumString} 
     */
    SupportedLanguages {
        get => this.get_SupportedLanguages()
    }

    /**
     * Gets the set of languages/dialects supported by the spell checker.
     * @remarks
     * The supported languages are specific, not neutral. For Hebrew, for example, the supported language is "he-IL", not "he".
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-get_supportedlanguages
     */
    get_SupportedLanguages() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    /**
     * Determines if the specified language is supported by this spell checker.
     * @param {PWSTR} languageTag A <a href="http://tools.ietf.org/html/bcp47">BCP47</a> language tag that identifies the language for the requested spell checker.
     * @returns {BOOL} <b>TRUE</b> if supported; <b>FALSE</b> if not supported.
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-issupported
     */
    IsSupported(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", languageTag, BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Creates a spell checker (implemented by a spell check provider) that supports the specified language.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-issupported">ISpellCheckProviderFactory::IsSupported</a> can be called to determine if <i>languageTag</i> is supported.
     * @param {PWSTR} languageTag A <a href="http://tools.ietf.org/html/bcp47">BCP47</a> language tag that identifies the language for the requested spell checker.
     * @returns {ISpellCheckProvider} The created spell checker.
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-createspellcheckprovider
     */
    CreateSpellCheckProvider(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(5, this, "ptr", languageTag, "ptr*", &value := 0, "HRESULT")
        return ISpellCheckProvider(value)
    }

    Query(iid) {
        if (ISpellCheckProviderFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupportedLanguages := CallbackCreate(GetMethod(implObj, "get_SupportedLanguages"), flags, 2)
        this.vtbl.IsSupported := CallbackCreate(GetMethod(implObj, "IsSupported"), flags, 3)
        this.vtbl.CreateSpellCheckProvider := CallbackCreate(GetMethod(implObj, "CreateSpellCheckProvider"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupportedLanguages)
        CallbackFree(this.vtbl.IsSupported)
        CallbackFree(this.vtbl.CreateSpellCheckProvider)
    }
}
