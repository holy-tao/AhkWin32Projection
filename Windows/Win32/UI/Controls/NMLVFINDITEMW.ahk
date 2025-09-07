#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\LVFINDINFOW.ahk

/**
 * Contains information the owner needs to find items requested by a virtual list-view control. This structure is used with the LVN_ODFINDITEM notification code. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMLVFINDITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvfinditemw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMLVFINDITEMW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information on this notification code.
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
     * Index of the item at which the search will start.
     * @type {Integer}
     */
    iStart {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvfindinfoa">LVFINDINFO</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvfindinfoa">LVFINDINFO</a> structure that contains information necessary to perform a search.
     * @type {LVFINDINFOW}
     */
    lvfi{
        get {
            if(!this.HasProp("__lvfi"))
                this.__lvfi := LVFINDINFOW(this.ptr + 32)
            return this.__lvfi
        }
    }
}
