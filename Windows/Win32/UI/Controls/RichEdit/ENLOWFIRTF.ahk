#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about an unsupported Rich Text Format (RTF) keyword in a Microsoft Rich Edit control.
 * @remarks
 * This structure is used with the <a href="https://msdn.microsoft.com/3b18320b-ebc3-44f2-a93c-e967a028c522">EN_LOWFIRTF</a> message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-enlowfirtf
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENLOWFIRTF {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Specifies an <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">CHAR</a>*</b>
     * 
     * The unsupported RTF keyword.
     */
    szControl : PSTR

}
