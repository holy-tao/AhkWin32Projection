#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Describes a row from a table containing selected properties for a specific object.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-srow
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SRow extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of padding bytes for aligning properly the property values to which the <b>lpProps</b> member points.
     * @type {Integer}
     */
    ulAdrEntryPad {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the count of property values to which <b>lpProps</b> points.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPSPropValue</b>
     * 
     * Pointer to an array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropvalue">SPropValue</a> that describe the property values for the columns in the row.
     * @type {Pointer<SPropValue>}
     */
    lpProps {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
