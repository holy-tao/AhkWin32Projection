#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCD_STAT_COUNTERS.ahk
#Include .\HCD_ISO_STAT_COUNTERS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class HCD_STAT_INFORMATION_2 extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ResetCounters {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TimeRead {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LockedMemoryUsed {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {HCD_STAT_COUNTERS}
     */
    Counters{
        get {
            if(!this.HasProp("__Counters"))
                this.__Counters := HCD_STAT_COUNTERS(this.ptr + 32)
            return this.__Counters
        }
    }

    /**
     * @type {HCD_ISO_STAT_COUNTERS}
     */
    IsoCounters{
        get {
            if(!this.HasProp("__IsoCounters"))
                this.__IsoCounters := HCD_ISO_STAT_COUNTERS(this.ptr + 56)
            return this.__IsoCounters
        }
    }
}
