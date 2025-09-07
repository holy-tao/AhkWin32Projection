#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSATTRIBUTE}
     */
    AttributeHeader{
        get {
            if(!this.HasProp("__AttributeHeader"))
                this.__AttributeHeader := KSATTRIBUTE(this.ptr + 0)
            return this.__AttributeHeader
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    SignalProcessingMode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
