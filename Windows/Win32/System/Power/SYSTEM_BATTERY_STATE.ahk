#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains information about the current state of the system battery.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_battery_state
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_BATTERY_STATE {
    #StructPack 4

    /**
     * If this member is <b>TRUE</b>, the system battery charger is currently operating on external 
     *       power.
     */
    AcOnLine : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, at least one battery is present in the system.
     */
    BatteryPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, a battery is currently charging.
     */
    Charging : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, a battery is currently discharging.
     */
    Discharging : BOOLEAN

    /**
     * Reserved.
     */
    Spare1 : BOOLEAN[3]

    Tag : Int8

    /**
     * The theoretical capacity of the battery when new.
     */
    MaxCapacity : UInt32

    /**
     * The estimated remaining capacity of the battery.
     */
    RemainingCapacity : UInt32

    /**
     * The current rate of discharge of the battery, in mW. A nonzero, positive rate indicates charging; a 
     *       negative rate indicates discharging. Some batteries report only discharging rates. This value should be treated 
     *       as a <b>LONG</b> as it can contain negative values (with the high bit set).
     */
    Rate : UInt32

    /**
     * The estimated time remaining on the battery, in seconds.
     */
    EstimatedTime : UInt32

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a low battery alert should occur. Definitions 
     *       of low vary from manufacturer to manufacturer. In general, a warning state will occur before a low state, but 
     *       you should not assume that it always will. To reduce risk of data loss, this value is usually used as the 
     *       default setting for the critical battery alarm.
     */
    DefaultAlert1 : UInt32

    /**
     * The manufacturer's suggestion of a capacity, in mWh, at which a warning battery alert should occur. 
     *       Definitions of warning vary from manufacturer to manufacturer. In general, a warning state will occur before a 
     *       low state, but you should not assume that it always will. To reduce risk of data loss, this value is usually 
     *       used as the default setting for the low battery alarm.
     */
    DefaultAlert2 : UInt32

}
