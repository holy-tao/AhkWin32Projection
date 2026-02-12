#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ADRENTRY (wabdefs.h) - do not use. Describes zero or more properties belonging to one or more recipients.
 * @see https://learn.microsoft.com/windows/win32/api//content/wabdefs/ns-wabdefs-adrentry
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ADRENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * @type {Integer}
     */
    ulReserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the count of properties in the property value array to which the <b>rgPropVals</b> member points. The <b>cValues</b> member can be zero.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPSPropValue</b>
     * 
     * Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropvalue">SPropValue</a> that specifies the property value array describing the properties for the recipient. The <b>rgPropVals</b> member can be <b>NULL</b>.
     * @type {Pointer<SPropValue>}
     */
    rgPropVals {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
