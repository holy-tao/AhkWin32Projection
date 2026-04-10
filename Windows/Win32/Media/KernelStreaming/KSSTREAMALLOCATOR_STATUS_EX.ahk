#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSALLOCATOR_FRAMING_EX.ahk
#Include .\KS_COMPRESSION.ahk
#Include .\KS_FRAMING_ITEM.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSSTREAMALLOCATOR_STATUS_EX extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {KSALLOCATOR_FRAMING_EX}
     */
    Framing {
        get {
            if(!this.HasProp("__Framing"))
                this.__Framing := KSALLOCATOR_FRAMING_EX(0, this)
            return this.__Framing
        }
    }

    /**
     * @type {Integer}
     */
    AllocatedFrames {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
