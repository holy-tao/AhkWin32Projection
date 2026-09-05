#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values used to specify how to do hyphenation in a rich edit control. The HyphenateProc callback function uses this enumeration type.
 * @remarks
 * Hyphenation rules are specific for each language; not all hyphenation types are valid for a given language.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ne-richedit-khyph
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class KHYPH extends Win32Enum {

    /**
     * No hyphenation is allowed.
     * Native name: khyphNil
     * @type {Integer (Int32)}
     */
    static Nil => 0

    /**
     * Do not change any characters during hyphenation.
     * Native name: khyphNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Add a letter before the hyphenation mark.
     * Native name: khyphAddBefore
     * @type {Integer (Int32)}
     */
    static AddBefore => 2

    /**
     * Change the letter before the hyphenation mark.
     * Native name: khyphChangeBefore
     * @type {Integer (Int32)}
     */
    static ChangeBefore => 3

    /**
     * Delete the letter before the hyphenation mark.
     * Native name: khyphDeleteBefore
     * @type {Integer (Int32)}
     */
    static DeleteBefore => 4

    /**
     * Change the letter after the hyphenation mark.
     * Native name: khyphChangeAfter
     * @type {Integer (Int32)}
     */
    static ChangeAfter => 5

    /**
     * The two letters before the hyphenation mark are replaced by one character; see the <b>chHyph</b> member of <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphresult">HYPHRESULT</a>.
     * Native name: khyphDelAndChange
     * @type {Integer (Int32)}
     */
    static DelAndChange => 6
}
