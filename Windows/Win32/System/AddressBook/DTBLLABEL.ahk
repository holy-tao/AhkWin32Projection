#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a label that will be used in a dialog box that is built from a display table.
 * @remarks
 * A **DTBLLABEL** structure describes a label control text that is displayed with another type of control to add meaning to that control. For example, most edit controls are positioned next to labels to inform the user of the type of information to be entered. Some controls, such as group boxes and radio buttons, hold their own labels. 
 *   
 * The label can include a Windows accelerator, identified as the character following the ampersand (&amp;). Pressing the accelerator key puts the focus in the first nonlabel, nonbutton control following this label in the display table.
 *   
 * There is no support for multiline labels. Showing multiple lines requires multiple labels.
 *   
 * It is not possible to use a label as a read-only edit control. The difference is that an edit control can be selected and copied whereas a label cannot. 
 *   
 * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtbllabel
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLLABEL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Position in memory of the character string label.
     * @type {Integer}
     */
    ulbLpszLabelName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Bitmask of flags used to designate the format of the label pointed to by the **ulbLpszLabelName** member. The following flag can be set: 
     *     
     * MAPI_UNICODE 
     *   
     * > The label is in Unicode format. If the MAPI_UNICODE flag is not set, the label is in ANSI format.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
