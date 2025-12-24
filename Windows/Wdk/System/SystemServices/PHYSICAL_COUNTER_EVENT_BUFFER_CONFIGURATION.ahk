#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PHYSICAL_COUNTER_EVENT_BUFFER_CONFIGURATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER>}
     */
    OverflowHandler {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CustomEventBufferEntrySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EventThreshold {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
