#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_SYNTHETIC_PROCESSOR_FEATURES.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BanksCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WHV_SYNTHETIC_PROCESSOR_FEATURES}
     */
    Bank0{
        get {
            if(!this.HasProp("__Bank0"))
                this.__Bank0 := WHV_SYNTHETIC_PROCESSOR_FEATURES(this.ptr + 8)
            return this.__Bank0
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    AsUINT64{
        get {
            if(!this.HasProp("__AsUINT64ProxyArray"))
                this.__AsUINT64ProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__AsUINT64ProxyArray
        }
    }
}
