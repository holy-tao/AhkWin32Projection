#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_DESCRIPTOR.ahk

/**
 * Defines an array of events in a provider manifest.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_event_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROVIDER_EVENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>EventDescriptorsArray</b> array.
     * @type {Integer}
     */
    NumberOfEvents {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structures that contain information about each event.
     * @type {Array<EVENT_DESCRIPTOR>}
     */
    EventDescriptorsArray{
        get {
            if(!this.HasProp("__EventDescriptorsArrayProxyArray"))
                this.__EventDescriptorsArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, EVENT_DESCRIPTOR, "")
            return this.__EventDescriptorsArrayProxyArray
        }
    }
}
