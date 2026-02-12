#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the status of the battery.
 * @remarks
 * This enumeration is used as part of the [BatteryReport](../windows.devices.power/batteryreport.md) class to provide information about a [Battery](../windows.devices.power/battery.md) object.
 * 
 * If the battery controller is removed after you create a [Battery](../windows.devices.power/battery.md) object, the [Status](../windows.devices.power/batteryreport_status.md) will be **NotPresent**.
 * 
 * An **Idle** status occurs when the charge rate is zero. The battery isn’t charging, but it is maintaining its current level of charge.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.batterystatus
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class BatteryStatus extends Win32Enum{

    /**
     * The battery or battery controller is not present.
     * @type {Integer (Int32)}
     */
    static NotPresent => 0

    /**
     * The battery is discharging.
     * @type {Integer (Int32)}
     */
    static Discharging => 1

    /**
     * The battery is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 2

    /**
     * The battery is charging.
     * @type {Integer (Int32)}
     */
    static Charging => 3
}
