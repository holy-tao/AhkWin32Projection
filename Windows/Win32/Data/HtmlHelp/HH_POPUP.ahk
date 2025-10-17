#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Use this structure to specify or modify the attributes of a pop-up window.
 * @see https://docs.microsoft.com/windows/win32/api//htmlhelp/ns-htmlhelp-hh_popup
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_POPUP extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies the size of the structure. This value must always be filled in before passing the structure to HtmlHelp().
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Instance handle of the program or DLL to retrieve the string resource from. Ignored if <i>idString</i> is zero, or if <i>idString</i> specifies a file name.
     * @type {HINSTANCE}
     */
    hinst{
        get {
            if(!this.HasProp("__hinst"))
                this.__hinst := HINSTANCE(8, this)
            return this.__hinst
        }
    }

    /**
     * Specifies zero, a resource ID, or a topic number in a text file.
     * @type {Integer}
     */
    idString {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the text to display if <i>idString</i> is zero.
     * @type {Pointer<SByte>}
     */
    pszText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies (in pixels) where the top center of the pop-up window should be located.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(32, this)
            return this.__pt
        }
    }

    /**
     * Specifies the RGB value to use for the foreground color of the pop-up window. To use the system color for the window text, specify -1.
     * @type {COLORREF}
     */
    clrForeground {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the RGB value to use for the background color of the pop-up window. To use the system color for the window background, specify -1.
     * @type {COLORREF}
     */
    clrBackground {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies (in pixels) the margins to use on the left, top, right, and bottom sides of the pop-up window. The default for all rectangle members is -1.
     * @type {RECT}
     */
    rcMargins{
        get {
            if(!this.HasProp("__rcMargins"))
                this.__rcMargins := RECT(48, this)
            return this.__rcMargins
        }
    }

    /**
     * Specifies the font attributes to use for the text in the pop-up window.
     * 
     * 
     * Use the following format to specify font family, point size, character set, and font format:
     * 
     * facename[, point size[, charset[ BOLD ITALIC UNDERLINE]]]
     * 
     * To omit an attribute, enter a comma. For example, to specify bold, 10-pt, MS Sans Serif font, <i>pszFont</i> would be:
     * 
     * MS Sans Serif, 10, , BOLD
     * @type {Pointer<SByte>}
     */
    pszFont {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
