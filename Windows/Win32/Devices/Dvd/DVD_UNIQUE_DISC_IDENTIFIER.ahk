#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class DVD_UNIQUE_DISC_IDENTIFIER extends Win32Struct {
    static sizeof => 18

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    RandomNumber {
        get {
            if(!this.HasProp("__RandomNumberProxyArray"))
                this.__RandomNumberProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__RandomNumberProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Year {
        get {
            if(!this.HasProp("__YearProxyArray"))
                this.__YearProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__YearProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Month {
        get {
            if(!this.HasProp("__MonthProxyArray"))
                this.__MonthProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "char")
            return this.__MonthProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Day {
        get {
            if(!this.HasProp("__DayProxyArray"))
                this.__DayProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__DayProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Hour {
        get {
            if(!this.HasProp("__HourProxyArray"))
                this.__HourProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "char")
            return this.__HourProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Minute {
        get {
            if(!this.HasProp("__MinuteProxyArray"))
                this.__MinuteProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__MinuteProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Second {
        get {
            if(!this.HasProp("__SecondProxyArray"))
                this.__SecondProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "char")
            return this.__SecondProxyArray
        }
    }
}
