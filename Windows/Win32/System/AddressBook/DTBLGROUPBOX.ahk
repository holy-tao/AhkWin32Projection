#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DTBLGROUPBOX describes a group box control that will be used in a dialog box built from a display table.
 * @remarks
 * A **DTBLGROUPBOX** structure describes a group box control that is used to visually associate other controls in the dialog box. The highlighting technique involves surrounding the other controls by a box. 
 *   
 * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblgroupbox
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLGROUPBOX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Position in memory of the character string that accompanies the group box. If displayed, the label appears on the top, left-hand side of the box.
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
}
