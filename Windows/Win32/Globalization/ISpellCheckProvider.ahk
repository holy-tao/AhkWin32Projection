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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LanguageTag", "Check", "Suggest", "GetOptionValue", "SetOptionValue", "get_OptionIds", "get_Id", "get_LocalizedName", "GetOptionDescription", "InitializeWordlist"]

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_languagetag
     */
    get_LanguageTag(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} text 
     * @param {Pointer<IEnumSpellingError>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-check
     */
    Check(text, value) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(4, this, "ptr", text, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} word 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-suggest
     */
    Suggest(word, value) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(5, this, "ptr", word, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-getoptionvalue
     */
    GetOptionValue(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", optionId, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-setoptionvalue
     */
    SetOptionValue(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(7, this, "ptr", optionId, "char", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_optionids
     */
    get_OptionIds(value) {
        result := ComCall(8, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_id
     */
    get_Id(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_localizedname
     */
    get_LocalizedName(value) {
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @param {Pointer<IOptionDescription>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-getoptiondescription
     */
    GetOptionDescription(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(11, this, "ptr", optionId, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wordlistType 
     * @param {IEnumString} words 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-initializewordlist
     */
    InitializeWordlist(wordlistType, words) {
        result := ComCall(12, this, "int", wordlistType, "ptr", words, "HRESULT")
        return result
    }
}
