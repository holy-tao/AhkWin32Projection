#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSALLOCATOR_FRAMING.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTREAMALLOCATOR_STATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {KSALLOCATOR_FRAMING}
     */
    Framing{
        get {
            if(!this.HasProp("__Framing"))
                this.__Framing := KSALLOCATOR_FRAMING(0, this)
            return this.__Framing
        }
    }

    /**
     * @type {Integer}
     */
    AllocatedFrames {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
