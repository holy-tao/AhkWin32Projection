#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Represents a timestamp.
 * @see https://docs.microsoft.com/windows/win32/api//wsdxml/ns-wsdxml-wsd_datetime
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_DATETIME extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * <b>TRUE</b> if <i>year</i> value is positive.
     * @type {BOOL}
     */
    isPositive{
        get {
            if(!this.HasProp("__isPositive"))
                this.__isPositive := BOOL(this.ptr + 0)
            return this.__isPositive
        }
    }

    /**
     * Year value (for example, 2005). This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    year {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One-based month value (1 = January, through 12 = December).
     * @type {Integer}
     */
    month {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * One-based day of the month value (1-31).
     * @type {Integer}
     */
    day {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Zero-based hour value (0 through 23). <i>hour</i>=24 is only allowed if both <i>minute</i> and <i>second</i> are 0.
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Zero-based minute value (0 through 59).
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Zero-based second value (0 through 59).
     * @type {Integer}
     */
    second {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Millisecond value (0-999). When this structure is converted to XML, the millisecond value is expressed as a fraction of a second in decimal form. For example, if <b>millisecond</b> has a value of 9, then the XML output will be 0.009.
     * @type {Integer}
     */
    millisecond {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>TRUE</b> if date and time are based on the local time zone, <b>FALSE</b> if UTC + offset.
     * @type {BOOL}
     */
    TZIsLocal{
        get {
            if(!this.HasProp("__TZIsLocal"))
                this.__TZIsLocal := BOOL(this.ptr + 20)
            return this.__TZIsLocal
        }
    }

    /**
     * <b>TRUE</b> if time zone offset specified by  <i>TZHour</i> and <i>TZMinute</i> is positive relative to UTC, <b>FALSE</b> if offset is negative. Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     * @type {BOOL}
     */
    TZIsPositive{
        get {
            if(!this.HasProp("__TZIsPositive"))
                this.__TZIsPositive := BOOL(this.ptr + 24)
            return this.__TZIsPositive
        }
    }

    /**
     * Time zone offset relative to UTC (0-13). <i>TZhour</i>=14 is allowed if <i>TZMinute</i> is 0. Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     * @type {Integer}
     */
    TZHour {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * Time zone offset relative to UTC (0-59). Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     * @type {Integer}
     */
    TZMinute {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }
}
