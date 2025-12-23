#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes FILETIME and provides syntax, members, and additional remarks.
 * @remarks
 * A property of type PT_SYSTIME has a **FILETIME** structure for its value. Such a property has a **FILETIME** data type for the **Value** member in its definition in an [SPropValue](spropvalue.md) structure. 
 *   
 * The definition of the **FILETIME** structure is in the _Win32 Programmer's Reference_ and in the MAPI header file Mapidefs.h. MAPI defines the structure conditionally to make sure that it is defined when the Win32 definition is unavailable.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/filetime
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class FILETIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Low-order 32 bits of the file time value.
     * @type {Integer}
     */
    dwLowDateTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > High-order 32 bits of the file time value.
     * @type {Integer}
     */
    dwHighDateTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
