#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains and receives display information for a toolbar item. This structure is used with the TBN_GETDISPINFO notification code.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines NMTBDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtbdispinfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMTBDISPINFOA extends Win32Struct
{
    static sizeof => 64

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
     * Type: <b>int</b>
     * 
     * Command identifier of the item for which display information is being requested. This member is filled in by the control before it sends the notification code.
     * @type {Integer}
     */
    idCommand {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Application-defined value associated with the item for which display information is being requested. This member is filled in by the control before sending the notification code.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Image index for the item.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a character buffer that receives the item's text.
     * @type {PSTR}
     */
    pszText{
        get {
            if(!this.HasProp("__pszText"))
                this.__pszText := PSTR(this.ptr + 48)
            return this.__pszText
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Size of the 
     * 					<b>pszText</b> buffer, in characters.
     * @type {Integer}
     */
    cchText {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
