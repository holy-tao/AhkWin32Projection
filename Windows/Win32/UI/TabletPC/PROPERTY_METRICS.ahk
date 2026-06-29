#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPERTY_UNITS.ahk" { PROPERTY_UNITS }

/**
 * Defines the range and resolution of a packet property.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-property_metrics
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct PROPERTY_METRICS {
    #StructPack 4

    /**
     * The minimum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 has a logical minimum of 0.
     */
    nLogicalMin : Int32

    /**
     * The maximum value, in logical units, that the tablet reports for this property. For example, a tablet reporting x-values from 0 to 9000 has a logical maximum of 9000.
     */
    nLogicalMax : Int32

    /**
     * The physical units of the property, such as inches or degrees. For a list of property units, see the <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ne-tpcshrd-property_units">PROPERTY_UNITS</a> enumeration type.
     */
    Units : PROPERTY_UNITS

    /**
     * The resolution or increment value for the <c>Units</c> member. For example, a tablet that reports 400 dots per inch (dpi) has an <i>fResoution</i> value of 400.
     */
    fResolution : Float32

}
