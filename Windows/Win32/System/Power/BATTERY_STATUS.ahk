#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the current state of the battery.
 * @remarks
 * The BATTERY\_CRITICAL flag in the **PowerState** member of this structure indicates a hardware "battery critical" condition. This critical level is set by the battery manufacturer, not by the user in the "critical battery alarm." It generally means that the battery system has calculated that the battery is totally drained, and any power being drawn is beyond what is expected.
 * @see https://learn.microsoft.com/windows/win32/Power/battery-status-str
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_STATUS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The battery state. This member can be zero, one, or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                   | Meaning                                                                                              |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
     * | <span id="BATTERY_CHARGING"></span><span id="battery_charging"></span><dl> <dt>**BATTERY\_CHARGING**</dt> <dt>0x00000004</dt> </dl>                  | Indicates that the battery is currently charging.<br/>                                         |
     * | <span id="BATTERY_CRITICAL"></span><span id="battery_critical"></span><dl> <dt>**BATTERY\_CRITICAL**</dt> <dt>0x00000008</dt> </dl>                  | Indicates that battery failure is imminent. See the Remarks section for more information.<br/> |
     * | <span id="BATTERY_DISCHARGING"></span><span id="battery_discharging"></span><dl> <dt>**BATTERY\_DISCHARGING**</dt> <dt>0x00000002</dt> </dl>         | Indicates that the battery is currently discharging.<br/>                                      |
     * | <span id="BATTERY_POWER_ON_LINE"></span><span id="battery_power_on_line"></span><dl> <dt>**BATTERY\_POWER\_ON\_LINE**</dt> <dt>0x00000001</dt> </dl> | Indicates that the system has access to AC power, so no batteries are being discharged.<br/>   |
     * @type {Integer}
     */
    PowerState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current battery capacity, in mWh (or relative). This value can be used to generate a "gas gauge" display by dividing it by **FullChargedCapacity** member of the [**BATTERY\_INFORMATION**](battery-information-str.md) structure. If the capacity is unavailable, this member is BATTERY\_UNKNOWN\_CAPACITY.
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The current battery voltage across the battery terminals, in millivolts (mv). If the voltage is unavailable, this member is BATTERY\_UNKNOWN\_VOLTAGE.
     * @type {Integer}
     */
    Voltage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The current rate of battery charge or discharge. This value will be in milliwatts unless the battery rate information is relative, in which case it will be in arbitrary units per hour. To determine if battery information is relative, examine the BATTERY\_CAPACITY\_RELATIVE flag in the **Capabilities** member of the [**BATTERY\_INFORMATION**](battery-information-str.md) structure. A nonzero, positive rate indicates charging; a negative rate indicates discharging. Some batteries report only discharging rates. If the rate is unavailable, this member is BATTERY\_UNKNOWN\_RATE. If the state of the battery or power source changes, the rate may become available.
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
