#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DTPAGE describes the dialog box that is built from a display table by the BuildDisplayTable function.
 * @remarks
 * To identify the Help file for the tabbed page, set either the **lpszComponent** member to a hard-coded string or the **ulItemID** member to an integer resource identifier. 
  *   
  * Each entry in the **[Help File Mappings]** section in MAPISVC.INF consists of a component string, no longer than 30 characters, on the left side and a Help file path on the right. Both **ulItemID** and **lpszResourceName** are found in the _hInstance_ parameter of **BuildDisplayTable**. For more information, see [MAPISVC.INF [Help File Mappings] Section](mapisvc-inf-help-file-mappings-section.md).
  *   
  * Although **BuildDisplayTable** uses this structure to build the display table from control resources, the **DTPAGE** structure never appears in the display table itself. 
  *   
  * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtpage
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTPAGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * > Count of controls pointed to by the **lpctl** member.
     * @type {Integer}
     */
    cctl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to the name or integer identifier for the dialog box resource.
     * @type {Pointer<SByte>}
     */
    lpszResourceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    lpszComponent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulItemID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * > Pointer to an array of [DTCTL](dtctl.md) structures, one for each control on the page.
     * @type {Pointer<DTCTL>}
     */
    lpctl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
