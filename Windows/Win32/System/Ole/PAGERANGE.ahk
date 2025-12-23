#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of pages.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-pagerange
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PAGERANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The first page of the range. This member can have any page number as a value. If this value is greater than the value specified in <b>nToPage</b>, the document will be printed in reverse page order.
     * @type {Integer}
     */
    nFromPage {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The last page of the range. A special value, <b>PAGESET_TOLASTPAGE</b>, indicates that all the remaining pages should be printed. This member can have any page number as a value. If this value is less than the value specified in <b>nFromPage</b>, the document will be printed in reverse page order.
     * @type {Integer}
     */
    nToPage {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
