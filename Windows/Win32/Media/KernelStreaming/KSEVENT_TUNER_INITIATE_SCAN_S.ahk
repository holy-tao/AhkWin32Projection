#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_TUNER_INITIATE_SCAN_S extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSEVENTDATA}
     */
    EventData{
        get {
            if(!this.HasProp("__EventData"))
                this.__EventData := KSEVENTDATA(0, this)
            return this.__EventData
        }
    }

    /**
     * @type {Integer}
     */
    StartFrequency {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    EndFrequency {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
