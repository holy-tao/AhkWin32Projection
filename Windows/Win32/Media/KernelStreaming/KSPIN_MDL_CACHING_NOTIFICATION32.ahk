#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSPIN_MDL_CACHING_EVENT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_MDL_CACHING_NOTIFICATION32 extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {KSPIN_MDL_CACHING_EVENT}
     */
    Event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Buffer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
