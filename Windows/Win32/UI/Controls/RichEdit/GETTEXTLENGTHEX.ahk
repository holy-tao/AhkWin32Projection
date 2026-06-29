#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GETTEXTLENGTHEX_FLAGS.ahk" { GETTEXTLENGTHEX_FLAGS }

/**
 * Contains information about how the text length of a rich edit control should be calculated. This structure is passed in the wParam in the EM_GETTEXTLENGTHEX message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-gettextlengthex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct GETTEXTLENGTHEX {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    flags : GETTEXTLENGTHEX_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Code page used in the translation. It is CP_ACP for ANSI Code Page and 1200 for Unicode.
     */
    codepage : UInt32

}
