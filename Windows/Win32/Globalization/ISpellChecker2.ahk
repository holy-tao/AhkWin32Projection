#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ISpellChecker.ahk

/**
 * Represents a particular spell checker for a particular language, with the added ability to remove words from the added words dictionary, or from the ignore list.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ispellchecker2
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ISpellChecker2 extends ISpellChecker{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpellChecker2
     * @type {Guid}
     */
    static IID => Guid("{e7ed1c71-87f7-4378-a840-c9200dacee47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Remove"]

    /**
     * Removes a word that was previously added by ISpellChecker.Add, or set by ISpellChecker.Ignore to be ignored.
     * @param {PWSTR} word The word to be removed from the list of added words, or from the list of ignored words. If the word is not present, nothing will be removed.
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
     * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nf-spellcheck-ispellchecker2-remove
     */
    Remove(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(17, this, "ptr", word, "HRESULT")
        return result
    }
}
