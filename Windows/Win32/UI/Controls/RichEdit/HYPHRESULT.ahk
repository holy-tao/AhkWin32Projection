#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KHYPH.ahk" { KHYPH }

/**
 * Contains information about the result of hyphenation in a Microsoft Rich Edit control.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphenateinfo">HYPHENATEINFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphresult
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct HYPHRESULT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ne-richedit-khyph">KHYPH</a></b>
     * 
     * The type of hyphenation.
     */
    khyph : KHYPH

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The index of the WCHAR in the passed string where hyphenation occurred.
     */
    ichHyph : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a></b>
     * 
     * The character used when hyphenation requires a replacement or an addition or a change. If no new character is needed, the value is zero.
     */
    chHyph : Int8

}
