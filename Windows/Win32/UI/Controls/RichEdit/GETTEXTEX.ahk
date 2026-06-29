#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GETTEXTEX_FLAGS.ahk" { GETTEXTEX_FLAGS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information used in getting text from a rich edit control. This structure used with the EM_GETTEXTEX message.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/Controls/em-gettextex">EM_GETTEXTEX</a> message is faster when both <b>lpDefaultChar</b> and <b>lpUsedDefChar</b> are <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-gettextex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct GETTEXTEX {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of the buffer used to store the retrieved text.
     */
    cb : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    flags : GETTEXTEX_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Code page used in the translation. It is <b>CP_ACP</b> for ANSI code page and 1200 for Unicode.
     */
    codepage : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The character used if a wide character cannot be represented in the specified code page. It is used only if the code page is <b>not</b> 1200 (Unicode). If this member is <b>NULL</b>, a system default value is used.
     */
    lpDefaultChar : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBOOL</a></b>
     * 
     * A flag that indicates whether the default character (<b>lpDefaultChar</b>) was used. This member is used only if the code page is not 1200 or <b>CP_UTF8</b> (Unicode). The flag is <b>TRUE</b> if one or more wide characters in the source string cannot be represented in the specified code page. Otherwise, the flag is <b>FALSE</b>. This member can be NULL.
     */
    lpUsedDefChar : BOOL.Ptr

}
