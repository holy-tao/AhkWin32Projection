#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\UI\Controls\NMHDR.ahk

/**
 * This structure returns the file name of the current topic and a constant that specifies the user action that is about to occur, such as hiding the Navigation pane by clicking the Hide button on the toolbar.
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hhntrack
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HHNTRACK extends Win32Struct
{
    static sizeof => 48

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
     * A multi-byte, zero-terminated string that specifies the current topic (before the action is taken).
     * @type {Pointer<Ptr>}
     */
    pszCurUrl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the action the user is about to take. This is an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/idaction-member">HHACT_</a> constant.
     * @type {Integer}
     */
    idAction {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A pointer to the current <a href="https://docs.microsoft.com/windows/desktop/api/htmlhelp/ns-htmlhelp-hh_wintype">HH_WINTYPE</a> structure.
     * @type {Pointer<HH_WINTYPE>}
     */
    phhWinType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
