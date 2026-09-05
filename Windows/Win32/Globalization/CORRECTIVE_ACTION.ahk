#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the type of corrective action to be taken for a spelling error.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/ne-spellcheck-corrective_action
 * @namespace Windows.Win32.Globalization
 */
class CORRECTIVE_ACTION extends Win32Enum {

    /**
     * There are no errors.
     * Native name: CORRECTIVE_ACTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The user should be prompted with a list of suggestions as returned by <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nf-spellcheck-ispellchecker-suggest">ISpellChecker::Suggest</a>.
     * Native name: CORRECTIVE_ACTION_GET_SUGGESTIONS
     * @type {Integer (Int32)}
     */
    static GET_SUGGESTIONS => 1

    /**
     * Replace the indicated erroneous text with the text provided in the suggestion. The user does not need to be prompted.
     * Native name: CORRECTIVE_ACTION_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 2

    /**
     * The user should be prompted to delete the indicated erroneous text.
     * Native name: CORRECTIVE_ACTION_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 3
}
