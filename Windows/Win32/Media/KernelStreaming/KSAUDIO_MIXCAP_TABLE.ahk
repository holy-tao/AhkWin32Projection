#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSAUDIO_MIX_CAPS.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIO_MIXCAP_TABLE extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    InputChannels {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OutputChannels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {KSAUDIO_MIX_CAPS}
     */
    Capabilities {
        get {
            if(!this.HasProp("__CapabilitiesProxyArray"))
                this.__CapabilitiesProxyArray := Win32FixedArray(this.ptr + 8, 1, KSAUDIO_MIX_CAPS, "")
            return this.__CapabilitiesProxyArray
        }
    }
}
