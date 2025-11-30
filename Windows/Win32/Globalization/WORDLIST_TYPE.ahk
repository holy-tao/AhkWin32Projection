#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies one of the types of word lists used by spell checkers.
 * @remarks
 * 
 * Providers should consider the following priority order when doing spell checking:
 * Ignored Words &gt; AutoCorrected Words &gt; Excluded Words &gt; Added Words &gt; Spell checking algorithm.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/ne-spellcheck-wordlist_type
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class WORDLIST_TYPE extends Win32Enum{

    /**
     * Words considered to be correctly spelled, but which are not offered as  suggestions. This word list isn't saved and is specific to a spelling session. (The others types of word lists are saved in the default custom dictionary files, and are global.)
     * @type {Integer (Int32)}
     */
    static WORDLIST_TYPE_IGNORE => 0

    /**
     * Words considered to be correctly spelled and which can be offered as  suggestions.
     * @type {Integer (Int32)}
     */
    static WORDLIST_TYPE_ADD => 1

    /**
     * Words considered to be incorrectly spelled.
     * @type {Integer (Int32)}
     */
    static WORDLIST_TYPE_EXCLUDE => 2

    /**
     * Word pairs of a misspelled word and the word that should replace it.
     * @type {Integer (Int32)}
     */
    static WORDLIST_TYPE_AUTOCORRECT => 3
}
