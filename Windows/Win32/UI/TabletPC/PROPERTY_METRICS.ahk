#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the range and resolution of a packet property.
 * @see https://docs.microsoft.com/windows/win32/api//tpcshrd/ns-tpcshrd-property_metrics
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PROPERTY_METRICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The minimum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 has a logical minimum of 0.
     * @type {Integer}
     */
    nLogicalMin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 has a logical maximum of 9000.
     * @type {Integer}
     */
    nLogicalMax {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The physical units of the property, such as inches or degrees. For a list of property units, see the <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ne-tpcshrd-property_units">PROPERTY_UNITS</a> enumeration type.
     * @type {Integer}
     */
    Units {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The resolution or increment value for the <c>Units</c> member. For example, a tablet that reports 400 dots per inch (dpi) has an <i>fResoution</i> value of 400.
     * @type {Float}
     */
    fResolution {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
