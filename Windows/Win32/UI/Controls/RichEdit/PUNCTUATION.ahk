#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the punctuation used in a rich edit control.
 * @remarks
 * This structure is used only in Asian-language versions of the operating system.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-punctuation
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct PUNCTUATION {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of buffer pointed to by the 
     * 					<b>szPunctuation</b> member, in bytes.
     */
    iSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * The buffer containing the punctuation characters.
     */
    szPunctuation : PSTR

}
