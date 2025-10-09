#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSQUERYBUFFER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := KSIDENTIFIER(this.ptr + 0)
            return this.__Event
        }
    }

    /**
     * @type {Pointer<KSEVENTDATA>}
     */
    EventData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
