#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\WINDOWPOS.ahk" { WINDOWPOS }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information used to set the size and position of a header control. HDLAYOUT is used with the HDM_LAYOUT message. This structure supersedes the HD_LAYOUT structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hdlayout
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HDLAYOUT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Structure that contains the coordinates of a rectangle that the header control will occupy.
     */
    prc : RECT.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-windowpos">WINDOWPOS</a>*</b>
     * 
     * Structure that receives information about the appropriate size and position of the header control.
     */
    pwpos : WINDOWPOS.Ptr

}
