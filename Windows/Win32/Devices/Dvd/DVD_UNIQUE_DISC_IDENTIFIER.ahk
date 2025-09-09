#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_UNIQUE_DISC_IDENTIFIER extends Win32Struct
{
    static sizeof => 18

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    RandomNumber{
        get {
            if(!this.HasProp("__RandomNumberProxyArray"))
                this.__RandomNumberProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__RandomNumberProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Year{
        get {
            if(!this.HasProp("__YearProxyArray"))
                this.__YearProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__YearProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Month{
        get {
            if(!this.HasProp("__MonthProxyArray"))
                this.__MonthProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "char")
            return this.__MonthProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Day{
        get {
            if(!this.HasProp("__DayProxyArray"))
                this.__DayProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__DayProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Hour{
        get {
            if(!this.HasProp("__HourProxyArray"))
                this.__HourProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "char")
            return this.__HourProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Minute{
        get {
            if(!this.HasProp("__MinuteProxyArray"))
                this.__MinuteProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__MinuteProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Second{
        get {
            if(!this.HasProp("__SecondProxyArray"))
                this.__SecondProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "char")
            return this.__SecondProxyArray
        }
    }
}
