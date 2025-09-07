#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_COMPRESSION.ahk
#Include .\KS_FRAMING_RANGE.ahk
#Include .\KS_FRAMING_RANGE_WEIGHTED.ahk
#Include .\KS_FRAMING_ITEM.ahk
#Include .\KSALLOCATOR_FRAMING_EX.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTREAMALLOCATOR_STATUS_EX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSALLOCATOR_FRAMING_EX}
     */
    Framing{
        get {
            if(!this.HasProp("__Framing"))
                this.__Framing := KSALLOCATOR_FRAMING_EX(this.ptr + 0)
            return this.__Framing
        }
    }

    /**
     * @type {Integer}
     */
    AllocatedFrames {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
