#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes FILETIME and provides syntax, members, and additional remarks.
 * @remarks
 * A property of type PT_SYSTIME has a **FILETIME** structure for its value. Such a property has a **FILETIME** data type for the **Value** member in its definition in an [SPropValue](spropvalue.md) structure. 
 *   
 * The definition of the **FILETIME** structure is in the _Win32 Programmer's Reference_ and in the MAPI header file Mapidefs.h. MAPI defines the structure conditionally to make sure that it is defined when the Win32 definition is unavailable.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/filetime
 * @namespace Windows.Win32.Foundation
 */
export default struct FILETIME {
    #StructPack 4

    /**
     * > Low-order 32 bits of the file time value.
     */
    dwLowDateTime : UInt32

    /**
     * > High-order 32 bits of the file time value.
     */
    dwHighDateTime : UInt32

}
