#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\UI\Controls\NMHDR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Use this structure to return the file name of the topic that has been navigated to, or to return the window type name of the help window that has been created.
 * @see https://docs.microsoft.com/windows/win32/api//htmlhelp/ns-htmlhelp-hhn_notify
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HHN_NOTIFY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Standard <b>WM_NOTIFY</b> header.
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
     * A multi-byte, zero-terminated string that specifies the topic navigated to, or the name of the help window being created.
     * @type {PSTR}
     */
    pszUrl{
        get {
            if(!this.HasProp("__pszUrl"))
                this.__pszUrl := PSTR(this.ptr + 24)
            return this.__pszUrl
        }
    }
}
