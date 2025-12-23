#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PROPERTY_METRICS.ahk

/**
 * Describes a packet property that is reported by the tablet driver.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-packet_property
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PACKET_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The property. This value is not limited to the set of predefined GUIDs. An application or a device driver may define new GUIDs at any time.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The range, units, and resolution of the packet property.
     * @type {PROPERTY_METRICS}
     */
    PropertyMetrics{
        get {
            if(!this.HasProp("__PropertyMetrics"))
                this.__PropertyMetrics := PROPERTY_METRICS(8, this)
            return this.__PropertyMetrics
        }
    }
}
