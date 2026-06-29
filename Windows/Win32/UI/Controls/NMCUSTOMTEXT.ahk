#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information used with custom text notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomtext
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMCUSTOMTEXT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context to draw to.
     */
    hDC : HDC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The string to draw.
     */
    lpString : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Length of lpString.
     */
    nCount : Int32

    /**
     * Type: <b>LPRECT</b>
     * 
     * The rect to draw in.
     */
    lpRect : RECT.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * One or more of the DT_* flags. For more information, see the description of the <i>uFormat</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtext">DrawText</a> function. This may be <b>NULL</b>.
     */
    uFormat : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether the text is a link.
     */
    fLink : BOOL

}
