#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_ITEM.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_COMPRESSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSALLOCATOR_FRAMING_EX extends Win32Struct {
    static sizeof => 112

    static packingSize => 4

    /**
     * @type {Integer}
     */
    CountItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PinFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {KS_COMPRESSION}
     */
    OutputCompression {
        get {
            if(!this.HasProp("__OutputCompression"))
                this.__OutputCompression := KS_COMPRESSION(8, this)
            return this.__OutputCompression
        }
    }

    /**
     * @type {Integer}
     */
    PinWeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {KS_FRAMING_ITEM}
     */
    FramingItem {
        get {
            if(!this.HasProp("__FramingItemProxyArray"))
                this.__FramingItemProxyArray := Win32FixedArray(this.ptr + 24, 1, KS_FRAMING_ITEM, "")
            return this.__FramingItemProxyArray
        }
    }
}
