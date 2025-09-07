#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_Timestamp.ahk
#Include .\MI_Interval.ahk

/**
 * Represents a union of MI_Timestamp and MI_Interval.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetime
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Datetime extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * If <b>isTimestamp</b> is nonzero, timestamp is used.  If <b>isTimestamp</b> is 0, interval is used.
     * @type {Integer}
     */
    isTimestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MI_Timestamp}
     */
    timestamp{
        get {
            if(!this.HasProp("__timestamp"))
                this.__timestamp := MI_Timestamp(this.ptr + 8)
            return this.__timestamp
        }
    }

    /**
     * @type {MI_Interval}
     */
    interval{
        get {
            if(!this.HasProp("__interval"))
                this.__interval := MI_Interval(this.ptr + 8)
            return this.__interval
        }
    }
}
