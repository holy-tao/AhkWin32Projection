#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The PROVIDOR\_INFO\_2 structure appends a print provider to the print provider order list.
 * @remarks
 * This structure is used when calling [**AddPrintProvidor**](addprintprovidor.md), level 2, to add the specified print provider to the end of the print provider order list. The provider is immediately used for routing if the call succeeds.
 * @see https://learn.microsoft.com/windows/win32/printdocs/providor-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PROVIDOR_INFO_2A extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the print provider.
     * @type {PSTR}
     */
    pOrder{
        get {
            if(!this.HasProp("__pOrder"))
                this.__pOrder := PSTR(this.ptr + 0)
            return this.__pOrder
        }
    }
}
