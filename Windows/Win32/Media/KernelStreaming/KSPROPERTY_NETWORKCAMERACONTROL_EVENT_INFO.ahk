#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_METADATA_ITEMHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KSCAMERA_METADATA_ITEMHEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := KSCAMERA_METADATA_ITEMHEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {String}
     */
    EventFilter {
        get => StrGet(this.ptr + 8, 0, "UTF-16")
        set => StrPut(value, this.ptr + 8, 0, "UTF-16")
    }
}
