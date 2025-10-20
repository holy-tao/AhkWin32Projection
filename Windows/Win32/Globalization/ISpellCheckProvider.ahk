#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents a particular spell checker provider for a particular language, to be used by the spell checking infrastructure.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellCheckProvider extends IUnknown{
    /**
     * The interface identifier for ISpellCheckProvider
     * @type {Guid}
     */
    static IID => Guid("{73e976e0-8ed4-4eb1-80d7-1be0a16b0c38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    get_LanguageTag(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} text 
     * @param {Pointer<IEnumSpellingError>} value 
     * @returns {HRESULT} 
     */
    Check(text, value) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(4, this, "ptr", text, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} word 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     */
    Suggest(word, value) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(5, this, "ptr", word, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Pointer<Byte>} value 
     * @returns {HRESULT} 
     */
    GetOptionValue(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(6, this, "ptr", optionId, "char*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetOptionValue(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(7, this, "ptr", optionId, "char", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     */
    get_OptionIds(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    get_Id(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    get_LocalizedName(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Pointer<IOptionDescription>} value 
     * @returns {HRESULT} 
     */
    GetOptionDescription(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(11, this, "ptr", optionId, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wordlistType 
     * @param {Pointer<IEnumString>} words 
     * @returns {HRESULT} 
     */
    InitializeWordlist(wordlistType, words) {
        result := ComCall(12, this, "int", wordlistType, "ptr", words, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
