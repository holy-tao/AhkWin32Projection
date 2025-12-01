#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values used to specify how to do hyphenation in a rich edit control. The HyphenateProc callback function uses this enumeration type.
 * @remarks
 * Hyphenation rules are specific for each language; not all hyphenation types are valid for a given language.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ne-richedit-khyph
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class KHYPH extends Win32Enum{

    /**
     * No hyphenation is allowed.
     * @type {Integer (Int32)}
     */
    static khyphNil => 0

    /**
     * Do not change any characters during hyphenation.
     * @type {Integer (Int32)}
     */
    static khyphNormal => 1

    /**
     * Add a letter before the hyphenation mark.
     * @type {Integer (Int32)}
     */
    static khyphAddBefore => 2

    /**
     * Change the letter before the hyphenation mark.
     * @type {Integer (Int32)}
     */
    static khyphChangeBefore => 3

    /**
     * Delete the letter before the hyphenation mark.
     * @type {Integer (Int32)}
     */
    static khyphDeleteBefore => 4

    /**
     * Change the letter after the hyphenation mark.
     * @type {Integer (Int32)}
     */
    static khyphChangeAfter => 5

    /**
     * The two letters before the hyphenation mark are replaced by one character; see the <b>chHyph</b> member of <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphresult">HYPHRESULT</a>.
     * @type {Integer (Int32)}
     */
    static khyphDelAndChange => 6
}
