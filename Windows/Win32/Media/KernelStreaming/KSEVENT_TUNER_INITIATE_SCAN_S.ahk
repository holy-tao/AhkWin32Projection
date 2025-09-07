#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_TUNER_INITIATE_SCAN_S extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSEVENTDATA}
     */
    EventData{
        get {
            if(!this.HasProp("__EventData"))
                this.__EventData := KSEVENTDATA(this.ptr + 0)
            return this.__EventData
        }
    }

    /**
     * @type {Integer}
     */
    StartFrequency {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    EndFrequency {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
