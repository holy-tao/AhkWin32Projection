#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IEnumString.ahk
#Include .\ISpellChecker.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * A factory for instantiating a spell checker (ISpellChecker) as well as providing functionality for determining which languages are supported.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ispellcheckerfactory
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellCheckerFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpellCheckerFactory
     * @type {Guid}
     */
    static IID => Guid("{8e018a9d-2415-4677-bf08-794ea61f94bb}")

    /**
     * The class identifier for SpellCheckerFactory
     * @type {Guid}
     */
    static CLSID => Guid("{7ab36653-1796-484b-bdfa-e74f1db7c1dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedLanguages", "IsSupported", "CreateSpellChecker"]

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellcheckerfactory-get_supportedlanguages
     */
    get_SupportedLanguages() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellcheckerfactory-issupported
     */
    IsSupported(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", languageTag, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @returns {ISpellChecker} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellcheckerfactory-createspellchecker
     */
    CreateSpellChecker(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(5, this, "ptr", languageTag, "ptr*", &value := 0, "HRESULT")
        return ISpellChecker(value)
    }
}
