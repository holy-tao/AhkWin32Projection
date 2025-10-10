#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include .\COMBOBOXEXITEMA.ahk

/**
 * Contains information specific to ComboBoxEx items for use with notification codes.
 * @remarks
 * 
  * > [!NOTE]
  * > The commctrl.h header defines NMCOMBOBOXEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmcomboboxexa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class NMCOMBOBOXEXA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-comboboxexitema">COMBOBOXEXITEM</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-comboboxexitema">COMBOBOXEXITEM</a> structure that holds item information specific to the current notification. Upon receiving a notification code, the <b>COMBOBOXEXITEM</b> structure holds information required for the owner to respond. The members of this structure are often used as fields for the owner to return values in response to the notification.
     * @type {COMBOBOXEXITEMA}
     */
    ceItem{
        get {
            if(!this.HasProp("__ceItem"))
                this.__ceItem := COMBOBOXEXITEMA(this.ptr + 24)
            return this.__ceItem
        }
    }
}
