#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to set the size and position of a header control. HDLAYOUT is used with the HDM_LAYOUT message. This structure supersedes the HD_LAYOUT structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hdlayout
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HDLAYOUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Structure that contains the coordinates of a rectangle that the header control will occupy.
     * @type {Pointer<RECT>}
     */
    prc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-windowpos">WINDOWPOS</a>*</b>
     * 
     * Structure that receives information about the appropriate size and position of the header control.
     * @type {Pointer<WINDOWPOS>}
     */
    pwpos {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
