#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information about header control notification messages. This structure supersedes the HD_NOTIFY structure. (ANSI)
 * @remarks
 * While most header control notifications pass a pointer to an <b>NMHEADER</b> structure, only some of them use the <b>pitem</b> member to pass an <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hditema">HDITEM</a> structure. Those that do use <b>pitem</b> may not provide complete information about the item. To obtain more information about an item, use <a href="https://docs.microsoft.com/windows/desktop/Controls/hdm-getitem">HDM_GETITEM</a>.
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines NMHEADER as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmheadera
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMHEADERA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification message.
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
     * The zero-based index of the header item that is the focus of the notification message.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    iButton {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hditema">HDITEM</a>*</b>
     * 
     * An optional pointer to an <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hditema">HDITEM</a> structure containing information about the item specified by 
     * 					<b>iItem</b>. The 
     * 					<b>mask</b> member of the <b>HDITEM</b> structure indicates which of its members are valid.
     * @type {Pointer<HDITEMA>}
     */
    pitem {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
