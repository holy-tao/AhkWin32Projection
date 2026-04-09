#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSPIN_MDL_CACHING_EVENT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_MDL_CACHING_NOTIFICATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KSPIN_MDL_CACHING_EVENT}
     */
    Event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
