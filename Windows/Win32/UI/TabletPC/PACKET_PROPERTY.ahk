#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPERTY_METRICS.ahk" { PROPERTY_METRICS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PROPERTY_UNITS.ahk" { PROPERTY_UNITS }

/**
 * Describes a packet property that is reported by the tablet driver.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-packet_property
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct PACKET_PROPERTY {
    #StructPack 4

    /**
     * The property. This value is not limited to the set of predefined GUIDs. An application or a device driver may define new GUIDs at any time.
     */
    guid : Guid

    /**
     * The range, units, and resolution of the packet property.
     */
    PropertyMetrics : PROPERTY_METRICS

}
