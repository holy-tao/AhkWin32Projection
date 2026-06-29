#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\COMBOBOX_EX_ITEM_FLAGS.ahk" { COMBOBOX_EX_ITEM_FLAGS }
#Import ".\COMBOBOXEXITEMA.ahk" { COMBOBOXEXITEMA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information specific to ComboBoxEx items for use with notification codes. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMCOMBOBOXEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcomboboxexa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMCOMBOBOXEXA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-comboboxexitema">COMBOBOXEXITEM</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-comboboxexitema">COMBOBOXEXITEM</a> structure that holds item information specific to the current notification. Upon receiving a notification code, the <b>COMBOBOXEXITEM</b> structure holds information required for the owner to respond. The members of this structure are often used as fields for the owner to return values in response to the notification.
     */
    ceItem : COMBOBOXEXITEMA

}
