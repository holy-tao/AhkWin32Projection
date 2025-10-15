#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information used with custom text notification.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmcustomtext
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMCUSTOMTEXT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * The device context to draw to.
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(this.ptr + 24)
            return this.__hDC
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The string to draw.
     * @type {PWSTR}
     */
    lpString{
        get {
            if(!this.HasProp("__lpString"))
                this.__lpString := PWSTR(this.ptr + 32)
            return this.__lpString
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Length of lpString.
     * @type {Integer}
     */
    nCount {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>LPRECT</b>
     * 
     * The rect to draw in.
     * @type {Pointer<RECT>}
     */
    lpRect {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * One or more of the DT_* flags. For more information, see the description of the <i>uFormat</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtext">DrawText</a> function. This may be <b>NULL</b>.
     * @type {Integer}
     */
    uFormat {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether the text is a link.
     * @type {BOOL}
     */
    fLink{
        get {
            if(!this.HasProp("__fLink"))
                this.__fLink := BOOL(this.ptr + 60)
            return this.__fLink
        }
    }
}
