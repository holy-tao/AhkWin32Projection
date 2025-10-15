#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\KernelStreaming\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSEVENTDATA_BDA_RF_TUNER_SCAN_S extends Win32Struct
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

    /**
     * @type {Integer}
     */
    LockRequested {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
