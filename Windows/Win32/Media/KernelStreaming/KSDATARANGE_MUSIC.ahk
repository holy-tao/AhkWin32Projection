#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDATARANGE_MUSIC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(this.ptr + 0)
            return this.__DataRange
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    Technology {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Channels {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Notes {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ChannelMask {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
