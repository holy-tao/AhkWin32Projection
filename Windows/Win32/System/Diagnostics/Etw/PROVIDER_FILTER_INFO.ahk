#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_PROPERTY_INFO.ahk

/**
 * Defines a filter and its data.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_filter_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROVIDER_FILTER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The filter identifier that identifies the filter in the manifest. This is the same value as the <b>value</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The version number that identifies the version of the filter definition in the manifest. This is the same value as the <b>version</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Offset from the beginning of this structure to the message string that describes the filter. This is the same value as the <b>message</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     * @type {Integer}
     */
    MessageOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of elements in the <i>EventPropertyInfoArray</i> array.
     * @type {Integer}
     */
    PropertyCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structures that define the filter data.
     * @type {Array<EVENT_PROPERTY_INFO>}
     */
    EventPropertyInfoArray{
        get {
            if(!this.HasProp("__EventPropertyInfoArrayProxyArray"))
                this.__EventPropertyInfoArrayProxyArray := Win32FixedArray(this.ptr + 16, 1, EVENT_PROPERTY_INFO, "")
            return this.__EventPropertyInfoArrayProxyArray
        }
    }
}
