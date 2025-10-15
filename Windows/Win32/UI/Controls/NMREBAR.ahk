#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * Contains information used in handling various rebar notifications.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmrebar
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMREBAR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index of the band affected by the notification. This will be -1 if no band is affected.
     * @type {Integer}
     */
    uBand {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The style of the band. This is one or more of the RBBS_ styles detailed in the 
     * 					<b>fStyle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-rebarbandinfoa">REBARBANDINFO</a> structure. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_STYLE.
     * @type {Integer}
     */
    fStyle {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined identifier of the band. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_ID.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value associated with the band. This member is only valid if 
     * 					<b>dwMask</b> contains RBNM_LPARAM.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 40)
            return this.__lParam
        }
    }
}
