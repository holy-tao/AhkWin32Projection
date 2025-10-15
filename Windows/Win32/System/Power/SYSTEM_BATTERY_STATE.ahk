#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains information about the current state of the system battery.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-system_battery_state
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_BATTERY_STATE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * If this member is <b>TRUE</b>, the system battery charger is currently operating on external 
     *       power.
     * @type {BOOLEAN}
     */
    AcOnLine{
        get {
            if(!this.HasProp("__AcOnLine"))
                this.__AcOnLine := BOOLEAN(this.ptr + 0)
            return this.__AcOnLine
        }
    }

    /**
     * If this member is <b>TRUE</b>, at least one battery is present in the system.
     * @type {BOOLEAN}
     */
    BatteryPresent{
        get {
            if(!this.HasProp("__BatteryPresent"))
                this.__BatteryPresent := BOOLEAN(this.ptr + 1)
            return this.__BatteryPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, a battery is currently charging.
     * @type {BOOLEAN}
     */
    Charging{
        get {
            if(!this.HasProp("__Charging"))
                this.__Charging := BOOLEAN(this.ptr + 2)
            return this.__Charging
        }
    }

    /**
     * If this member is <b>TRUE</b>, a battery is currently discharging.
     * @type {BOOLEAN}
     */
    Discharging{
        get {
            if(!this.HasProp("__Discharging"))
                this.__Discharging := BOOLEAN(this.ptr + 3)
            return this.__Discharging
        }
    }

    /**
     * Reserved.
     * @type {Array<BOOLEAN>}
     */
    Spare1{
        get {
            if(!this.HasProp("__Spare1ProxyArray"))
                this.__Spare1ProxyArray := Win32FixedArray(this.ptr + 8, 3, BOOLEAN, "")
            return this.__Spare1ProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * The theoretical capacity of the battery when new.
     * @type {Integer}
     */
    MaxCapacity {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The estimated remaining capacity of the battery.
     * @type {Integer}
     */
    RemainingCapacity {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The current rate of discharge of the battery, in mW. A nonzero, positive rate indicates charging; a 
     *       negative rate indicates discharging. Some batteries report only discharging rates. This value should be treated 
     *       as a <b>LONG</b> as it can contain negative values (with the high bit set).
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The estimated time remaining on the battery, in seconds.
     * @type {Integer}
     */
    EstimatedTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a low battery alert should occur. Definitions 
     *       of low vary from manufacturer to manufacturer. In general, a warning state will occur before a low state, but 
     *       you should not assume that it always will. To reduce risk of data loss, this value is usually used as the 
     *       default setting for the critical battery alarm.
     * @type {Integer}
     */
    DefaultAlert1 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a warning battery alert should occur. 
     *       Definitions of warning vary from manufacturer to manufacturer. In general, a warning state will occur before a 
     *       low state, but you should not assume that it always will. To reduce risk of data loss, this value is usually 
     *       used as the default setting for the low battery alarm.
     * @type {Integer}
     */
    DefaultAlert2 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
