#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IEnumString.ahk
#Include .\ISpellCheckProvider.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * A factory for instantiating a spell checker (ISpellCheckProvider) as well as providing functionality for determining which languages are supported.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheckprovider/nn-spellcheckprovider-ispellcheckproviderfactory
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellCheckProviderFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpellCheckProviderFactory
     * @type {Guid}
     */
    static IID => Guid("{9f671e11-77d6-4c92-aefb-615215e3a4be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedLanguages", "IsSupported", "CreateSpellCheckProvider"]

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-get_supportedlanguages
     */
    get_SupportedLanguages() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-issupported
     */
    IsSupported(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", languageTag, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @returns {ISpellCheckProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckproviderfactory-createspellcheckprovider
     */
    CreateSpellCheckProvider(languageTag) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(5, this, "ptr", languageTag, "ptr*", &value := 0, "HRESULT")
        return ISpellCheckProvider(value)
    }
}
