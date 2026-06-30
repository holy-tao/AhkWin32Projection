#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDATARANGE_MUSIC extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange {
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(0, this)
            return this.__DataRange
        }
    }

    /**
     * @type {Guid}
     */
    Technology {
        get {
            if(!this.HasProp("__Technology"))
                this.__Technology := Guid(72, this)
            return this.__Technology
        }
    }

    /**
     * @type {Integer}
     */
    Channels {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Notes {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    ChannelMask {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
