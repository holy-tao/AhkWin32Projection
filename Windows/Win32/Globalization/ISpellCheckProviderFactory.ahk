#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * A factory for instantiating a spell checker (ISpellCheckProvider) as well as providing functionality for determining which languages are supported.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheckprovider/nn-spellcheckprovider-ispellcheckproviderfactory
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellCheckProviderFactory extends IUnknown{
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
     * 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     */
    get_SupportedLanguages(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    IsSupported(languageTag, value) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(4, this, "ptr", languageTag, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} languageTag 
     * @param {Pointer<ISpellCheckProvider>} value 
     * @returns {HRESULT} 
     */
    CreateSpellCheckProvider(languageTag, value) {
        languageTag := languageTag is String ? StrPtr(languageTag) : languageTag

        result := ComCall(5, this, "ptr", languageTag, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
