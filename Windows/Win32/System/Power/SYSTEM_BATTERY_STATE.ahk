#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the current state of the system battery.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_battery_state
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_BATTERY_STATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * If this member is <b>TRUE</b>, the system battery charger is currently operating on external 
     *       power.
     * @type {Integer}
     */
    AcOnLine {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, at least one battery is present in the system.
     * @type {Integer}
     */
    BatteryPresent {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * If this member is <b>TRUE</b>, a battery is currently charging.
     * @type {Integer}
     */
    Charging {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * If this member is <b>TRUE</b>, a battery is currently discharging.
     * @type {Integer}
     */
    Discharging {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Spare1{
        get {
            if(!this.HasProp("__Spare1ProxyArray"))
                this.__Spare1ProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__Spare1ProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * The theoretical capacity of the battery when new.
     * @type {Integer}
     */
    MaxCapacity {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The estimated remaining capacity of the battery.
     * @type {Integer}
     */
    RemainingCapacity {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The current rate of discharge of the battery, in mW. A nonzero, positive rate indicates charging; a 
     *       negative rate indicates discharging. Some batteries report only discharging rates. This value should be treated 
     *       as a <b>LONG</b> as it can contain negative values (with the high bit set).
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The estimated time remaining on the battery, in seconds.
     * @type {Integer}
     */
    EstimatedTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a low battery alert should occur. Definitions 
     *       of low vary from manufacturer to manufacturer. In general, a warning state will occur before a low state, but 
     *       you should not assume that it always will. To reduce risk of data loss, this value is usually used as the 
     *       default setting for the critical battery alarm.
     * @type {Integer}
     */
    DefaultAlert1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a warning battery alert should occur. 
     *       Definitions of warning vary from manufacturer to manufacturer. In general, a warning state will occur before a 
     *       low state, but you should not assume that it always will. To reduce risk of data loss, this value is usually 
     *       used as the default setting for the low battery alarm.
     * @type {Integer}
     */
    DefaultAlert2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
