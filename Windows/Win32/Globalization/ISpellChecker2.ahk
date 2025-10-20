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
     * 
     * @param {PWSTR} word 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellchecker2-remove
     */
    Remove(word) {
        word := word is String ? StrPtr(word) : word

        result := ComCall(17, this, "ptr", word, "HRESULT")
        return result
    }
}
