#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DTBLRADIOBUTTON describes one radio button that will be part of a radio button group, which will be used in a dialog box that is built from a display table.
 * @remarks
 * A **DTBLRADIOBUTTON** structure describes a radio button a button control that is associated with a group of buttons. Only one button in the group can be checked; setting one button causes the other buttons in the group to be unset. 
  *   
  * The button count is the number of radio buttons in the group. The structures for the other radio buttons in the group must be in subsequent rows in the display table. Each of these structures should have the same value for its button count.
  *   
  * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblradiobutton
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLRADIOBUTTON extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * > Position in memory of the character string label for the radio button.
     * @type {Integer}
     */
    ulbLpszLabel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Bitmask of flags used to designate the format of the label pointed to by the **ulbLpszLabel** member. The following flag can be set: 
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

    /**
     * > Count of buttons in the radio button group. The **DTBLRADIOBUTTON** structures for the other buttons in the group must be contained in successive rows of the display table. Each of these rows should contain the same value for the **ulcButtons** member.
     * @type {Integer}
     */
    ulcButtons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * > Property tag for a property of type PT_LONG. The initial selection in the radio button group is based on the initial value of this property. Each button in the group must have **ulPropTag** set to the same property.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * > Unique number that identifies the selected button.
     * @type {Integer}
     */
    lReturnValue {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
