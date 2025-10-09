#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_TIME_INTERVAL extends Win32Struct
{
    static sizeof => 48

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
    TimeBase {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Interval {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
