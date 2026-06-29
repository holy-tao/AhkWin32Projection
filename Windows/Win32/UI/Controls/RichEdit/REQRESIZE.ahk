#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains the requested size of a rich edit control. A rich edit control sends this structure to its parent window as part of an EN_REQUESTRESIZE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-reqresize
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct REQRESIZE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Notification header.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Requested new size.
     */
    rc : RECT

}
