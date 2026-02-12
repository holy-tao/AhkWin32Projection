#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IEnumSpellingError.ahk
#Include ..\System\Com\IEnumString.ahk
#Include .\IOptionDescription.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents a particular spell checker provider for a particular language, to be used by the spell checking infrastructure.
 * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider
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
     * @type {PWSTR} 
     */
    LanguageTag {
        get => this.get_LanguageTag()
    }

    /**
     * @type {IEnumString} 
     */
    OptionIds {
        get => this.get_OptionIds()
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {PWSTR} 
     */
    LocalizedName {
        get => this.get_LocalizedName()
    }

    /**
     * Gets the BCP47 language tag this instance of the spell checker supports. (ISpellCheckProvider.get_LanguageTag)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_languagetag
     */
    get_LanguageTag() {
        result := ComCall(3, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Checks the spelling of the supplied text and returns a collection of spelling errors. (ISpellCheckProvider.Check)
     * @remarks
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> should contain the results of spell checking. A correct <i>text</i> should return an empty (not a null) enumeration.
     * @param {PWSTR} text The text to check.
     * @returns {IEnumSpellingError} The result of checking this text, returned as an <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-check
     */
    Check(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(4, this, "ptr", text, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSpellingError(value)
    }

    /**
     * Retrieves spelling suggestions for the supplied text. (ISpellCheckProvider.Suggest)
     * @param {PWSTR} word The word or phrase to get suggestions for.
     * @returns {IEnumString} The list of suggestions, returned as an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-suggest
     */
    Suggest(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(5, this, "ptr", word, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumString(value)
    }

    /**
     * Retrieves the value associated with the given option. (ISpellCheckProvider.GetOptionValue)
     * @param {PWSTR} optionId The option identifier.
     * @returns {Integer} The value associated with <i>optionId</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-getoptionvalue
     */
    GetOptionValue(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(6, this, "ptr", optionId, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the value associated with the given option.
     * @remarks
     * This method is called by the system, which reads the option values that were set by the user in the control panel and sends them to the <a href="https://docs.microsoft.com/windows/desktop/api/spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider">ISpellCheckProvider</a>. If the option was not set, this method will not be called and the provider should initialize itself internally with the default value for the option.
     * @param {PWSTR} optionId The option identifier.
     * @param {Integer} value The value to associate with <i>optionId</i>.
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
     * <i>optionId</i> is an empty string, or it is not one of the available options.
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
     * <i>optionId</i> is a null pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-setoptionvalue
     */
    SetOptionValue(optionId, value) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(7, this, "ptr", optionId, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets all of the declared option identifiers recognized by the spell checker.
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_optionids
     */
    get_OptionIds() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumString(value)
    }

    /**
     * Gets the identifier for this spell checker engine.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_id
     */
    get_Id() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets text, suitable to display to the user, that describes this spell checker. (ISpellCheckProvider.get_LocalizedName)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-get_localizedname
     */
    get_LocalizedName() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the information (id, description, heading and labels) of a specific option. (ISpellCheckProvider.GetOptionDescription)
     * @param {PWSTR} optionId Identifier of the option to be retrieved.
     * @returns {IOptionDescription} <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ioptiondescription">IOptionDescription</a> interface that contains the information about <i>optionId</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-getoptiondescription
     */
    GetOptionDescription(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(11, this, "ptr", optionId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOptionDescription(value)
    }

    /**
     * Initialize the specified word list to contain only the specified words.
     * @remarks
     * This method is called by the system (for example, when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-add">ISpellChecker::Add</a>), which passes the words from the respective word list to the provider so that it can consider the word list when spell checking.
     * @param {Integer} wordlistType The type of word list.
     * @param {IEnumString} words The set of words to be included in the word list, passed as an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> object..
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
     * <i>wordlistType</i> is not a valid member of the <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/ne-spellcheck-wordlist_type">WORDLIST_TYPE</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-initializewordlist
     */
    InitializeWordlist(wordlistType, words) {
        result := ComCall(12, this, "int", wordlistType, "ptr", words, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
