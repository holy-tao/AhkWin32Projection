#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IEnumSpellingError.ahk
#Include ..\System\Com\IEnumString.ahk
#Include .\IOptionDescription.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents a particular spell checker for a particular language.
 * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nn-spellcheck-ispellchecker
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
     * Gets the BCP47 language tag this instance of the spell checker supports. (ISpellChecker.get_LanguageTag)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-get_languagetag
     */
    get_LanguageTag() {
        result := ComCall(3, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Checks the spelling of the supplied text and returns a collection of spelling errors. (ISpellChecker.Check)
     * @remarks
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> contains the results of spell checking. A correct <i>text</i> returns an empty (not a null) enumeration.
     * @param {PWSTR} text The text to check.
     * @returns {IEnumSpellingError} The result of checking this text, returned as an <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-check
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
     * Retrieves spelling suggestions for the supplied text. (ISpellChecker.Suggest)
     * @param {PWSTR} word The word or phrase to get suggestions for.
     * @returns {IEnumString} The list of suggestions, returned as an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-suggest
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
     * Treats the provided word as though it were part of the original dictionary.
     * @param {PWSTR} word The word to be added to the list of added words.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-add
     */
    Add(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(6, this, "ptr", word, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ignores the provided word for the rest of this session.
     * @param {PWSTR} word The word to ignore.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-ignore
     */
    Ignore(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(7, this, "ptr", word, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes occurrences of one word to be replaced by another.
     * @param {PWSTR} from The incorrectly spelled word to be autocorrected.
     * @param {PWSTR} to The correctly spelled word that should replace <i>from</i>.
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
     * <i>from</i> or <i>to</i> is an empty string, or the length of at least one of the parameters is greater than <b>MAX_WORD_LENGTH</b>.
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
     * <i>from</i> or <i>to</i> is a null pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-autocorrect
     */
    AutoCorrect(from, to) {
        from := from is String ? StrPtr(from) : from
        to := to is String ? StrPtr(to) : to

        result := ComCall(8, this, "ptr", from, "ptr", to, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value associated with the given option. (ISpellChecker.GetOptionValue)
     * @param {PWSTR} optionId The option identifier.
     * @returns {Integer} The value associated with <i>optionId</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-getoptionvalue
     */
    GetOptionValue(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(9, this, "ptr", optionId, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets all of the declared option identifiers.
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-get_optionids
     */
    get_OptionIds() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumString(value)
    }

    /**
     * Gets the identifier for this spell checker.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-get_id
     */
    get_Id() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets text, suitable to display to the user, that describes this spell checker. (ISpellChecker.get_LocalizedName)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-get_localizedname
     */
    get_LocalizedName() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Adds an event handler (ISpellCheckerChangedEventHandler) for the SpellCheckerChanged event.
     * @remarks
     * The SpellCheckerChanged event fires whenever the state of the spell checker changes in a way such that any text that has been checked should be rechecked. This should happen when the contents of a word list changes, when an option changes, or when the default spell checker changes.
     * @param {ISpellCheckerChangedEventHandler} handler The handler to invoke when the spell checker changes.
     * @returns {Integer} An event cookie that uniquely identifies the added handler. This cookie must be passed to <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-remove_spellcheckerchanged">remove_SpellCheckerChanged</a> to stop this handler from being invoked by spell checker changes.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-add_spellcheckerchanged
     */
    add_SpellCheckerChanged(handler) {
        result := ComCall(13, this, "ptr", handler, "uint*", &eventCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * Removes an event handler (ISpellCheckerChangedEventHandler) that has been added for the SpellCheckerChanged event.
     * @param {Integer} eventCookie The event cookie that uniquely identifies the added handler. This is the <i>eventCookie</i> that was obtained from the call to <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-add_spellcheckerchanged">add_SpellCheckerChanged</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-remove_spellcheckerchanged
     */
    remove_SpellCheckerChanged(eventCookie) {
        result := ComCall(14, this, "uint", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the information (id, description, heading and labels) of a specific option. (ISpellChecker.GetOptionDescription)
     * @param {PWSTR} optionId Identifier of the option to be retrieved.
     * @returns {IOptionDescription} <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ioptiondescription">IOptionDescription</a> interface that contains the information about <i>optionId</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-getoptiondescription
     */
    GetOptionDescription(optionId) {
        optionId := optionId is String ? StrPtr(optionId) : optionId

        result := ComCall(15, this, "ptr", optionId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOptionDescription(value)
    }

    /**
     * Checks the spelling of the supplied text in a more thorough manner than ISpellChecker::Check, and returns a collection of spelling errors.
     * @remarks
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> contains the results of spell checking. A correct <i>text</i> returns an empty (not a null) enumeration.
     * 
     * If the provider supports two "modes" of spell checking (a faster one and a slower but more thorough one), it implements <a href="https://docs.microsoft.com/windows/desktop/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider">IComprehensiveSpellCheckProvider</a> to support the more thorough checking mode. 
     * When a client calls <b>ISpellChecker::ComprehensiveCheck</b>, the spell checking functionality will <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> the provider for <b>IComprehensiveSpellCheckProvider</b>, and call <a href="https://docs.microsoft.com/windows/desktop/Intl/icomprehensivespellcheckprovider-comprehensivecheck">IComprehensiveSpellCheckProvider.ComprehensiveCheck</a> if the interface is supported. If the interface isn't supported, it will silently fall back to <a href="https://docs.microsoft.com/windows/desktop/api/spellcheckprovider/nf-spellcheckprovider-ispellcheckprovider-check">ISpellCheckProvider::Check</a>.
     * @param {PWSTR} text The text to check.
     * @returns {IEnumSpellingError} The result of checking this text, returned as an <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ienumspellingerror">IEnumSpellingError</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/spellcheck/nf-spellcheck-ispellchecker-comprehensivecheck
     */
    ComprehensiveCheck(text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(16, this, "ptr", text, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSpellingError(value)
    }
}
