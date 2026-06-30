#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_FRAMING_ITEM.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSALLOCATOR_FRAMING_EX.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_COMPRESSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSSTREAMALLOCATOR_STATUS_EX extends Win32Struct {
    static sizeof => 120

    static packingSize => 4

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
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }
}
