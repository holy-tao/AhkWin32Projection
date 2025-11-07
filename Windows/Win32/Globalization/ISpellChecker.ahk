#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IEnumSpellingError.ahk
#Include ..\System\Com\IEnumString.ahk
#Include .\IOptionDescription.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents a particular spell checker for a particular language.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ispellchecker
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellChecker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpellChecker
     * @type {Guid}
     */
    static IID => Guid("{b6fd0b71-e2bc-4653-8d05-f197e412770b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LanguageTag", "Check", "Suggest", "Add", "Ignore", "AutoCorrect", "GetOptionValue", "get_OptionIds", "get_Id", "get_LocalizedName", "add_SpellCheckerChanged", "remove_SpellCheckerChanged", "GetOptionDescription", "ComprehensiveCheck"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-get_languagetag
     */
    get_LanguageTag() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {PWSTR} text 
     * @returns {IEnumSpellingError} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-check
     */
    Check(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(4, this, "ptr", text, "ptr*", &value := 0, "HRESULT")
        return IEnumSpellingError(value)
    }

    /**
     * 
     * @param {PWSTR} word 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-suggest
     */
    Suggest(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(5, this, "ptr", word, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    /**
     * 
     * @param {PWSTR} word 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-add
     */
    Add(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(6, this, "ptr", word, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} word 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-ignore
     */
    Ignore(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(7, this, "ptr", word, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} from 
     * @param {PWSTR} to 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-autocorrect
     */
    AutoCorrect(from, to) {
        from := from is String ? StrPtr(from) : from
        to := to is String ? StrPtr(to) : to

        result := ComCall(8, this, "ptr", from, "ptr", to, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-getoptionvalue
     */
    GetOptionValue(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(9, this, "ptr", optionId, "char*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-get_optionids
     */
    get_OptionIds() {
        result := ComCall(10, this, "ptr*", &value := 0, "HRESULT")
        return IEnumString(value)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-get_id
     */
    get_Id() {
        result := ComCall(11, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-get_localizedname
     */
    get_LocalizedName() {
        result := ComCall(12, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {ISpellCheckerChangedEventHandler} handler 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-add_spellcheckerchanged
     */
    add_SpellCheckerChanged(handler) {
        result := ComCall(13, this, "ptr", handler, "uint*", &eventCookie := 0, "HRESULT")
        return eventCookie
    }

    /**
     * 
     * @param {Integer} eventCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-remove_spellcheckerchanged
     */
    remove_SpellCheckerChanged(eventCookie) {
        result := ComCall(14, this, "uint", eventCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} optionId 
     * @returns {IOptionDescription} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-getoptiondescription
     */
    GetOptionDescription(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(15, this, "ptr", optionId, "ptr*", &value := 0, "HRESULT")
        return IOptionDescription(value)
    }

    /**
     * 
     * @param {PWSTR} text 
     * @returns {IEnumSpellingError} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker-comprehensivecheck
     */
    ComprehensiveCheck(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(16, this, "ptr", text, "ptr*", &value := 0, "HRESULT")
        return IEnumSpellingError(value)
    }
}
