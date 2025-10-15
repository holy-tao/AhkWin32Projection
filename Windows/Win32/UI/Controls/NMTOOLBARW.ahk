#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include .\TBBUTTON.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information used to process toolbar notification codes. This structure supersedes the TBNOTIFY structure.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines NMTOOLBAR as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtoolbarw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMTOOLBARW extends Win32Struct
{
    static sizeof => 96

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
     * Type: <b>int</b>
     * 
     * Command identifier of the button associated with the notification code.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structure that contains information about the toolbar button associated with the notification code. This member only contains valid information with the <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-queryinsert">TBN_QUERYINSERT</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-querydelete">TBN_QUERYDELETE</a> notification codes.
     * @type {TBBUTTON}
     */
    tbButton{
        get {
            if(!this.HasProp("__tbButton"))
                this.__tbButton := TBBUTTON(this.ptr + 32)
            return this.__tbButton
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Count of characters in the button text.
     * @type {Integer}
     */
    cchText {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains the button text.
     * @type {PWSTR}
     */
    pszText{
        get {
            if(!this.HasProp("__pszText"))
                this.__pszText := PWSTR(this.ptr + 72)
            return this.__pszText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the area covered by the button.
     * @type {RECT}
     */
    rcButton{
        get {
            if(!this.HasProp("__rcButton"))
                this.__rcButton := RECT(this.ptr + 80)
            return this.__rcButton
        }
    }
}
