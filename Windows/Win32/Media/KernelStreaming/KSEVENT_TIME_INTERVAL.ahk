#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSEVENTDATA.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_TIME_INTERVAL extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSEVENTDATA}
     */
    EventData {
        get {
            if(!this.HasProp("__EventData"))
                this.__EventData := KSEVENTDATA(0, this)
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
