#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EALocationCodeType structure defines an Emergency Alert (EA) location code, as defined in ANSI/SCTE 28.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface_enums/ns-bdaiface_enums-ealocationcodetype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class EALocationCodeType extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Identifies the standard that shall be used to interpret the other members of this structure. Currently this value must be SCTE_18, meaning SCTE 18, "Emergency Alert Message for Cable."
     * @type {Integer}
     */
    LocationCodeScheme {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains the state_code field.
     * @type {Integer}
     */
    state_code {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Contains the county_subdivision field.
     * @type {Integer}
     */
    county_subdivision {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Contains the county_code field.
     * @type {Integer}
     */
    county_code {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
