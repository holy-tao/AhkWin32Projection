#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the power status of the system.
 * @remarks
 * 
  * The system is only capable of estimating <b>BatteryFullLifeTime</b> based on calculations on <b>BatteryLifeTime</b> and <b>BatteryLifePercent</b>. Without smart battery subsystems, this value may not be accurate enough to be useful.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-system_power_status
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_POWER_STATUS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    ACLineStatus {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The battery charge status. This member can contain one or more of the following flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * High—the battery capacity is at more than 66 percent
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Low—the battery capacity is at less than 33 percent
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Critical—the battery capacity is at less than five percent
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Charging
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>128</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No system battery
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>255</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown status—unable to read the battery flag information
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The value is zero if the battery is not being charged and the battery capacity is between low and high.
     * @type {Integer}
     */
    BatteryFlag {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The percentage of full battery charge remaining. This member can be a value in the range 0 to 100, or 255 if status is unknown.
     * @type {Integer}
     */
    BatteryLifePercent {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The status of battery saver. To participate in energy conservation, avoid resource intensive tasks when battery saver is on. To be notified when this value changes, call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpowersettingnotification">RegisterPowerSettingNotification</a> function with the <a href="https://docs.microsoft.com/windows/desktop/Power/power-setting-guids">power setting GUID</a>, <b>GUID_POWER_SAVING_STATUS</b>. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Battery saver is off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Battery saver on. Save energy where  possible.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  This flag and the <b>GUID_POWER_SAVING_STATUS</b> GUID were introduced in Windows 10. This flag was previously reserved, named <b>Reserved1</b>, and had a value of 0.</div>
     * <div> </div>
     * For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * @type {Integer}
     */
    SystemStatusFlag {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The number of seconds of battery life remaining, or –1 if remaining seconds are unknown or if the device is connected to AC power.
     * @type {Integer}
     */
    BatteryLifeTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of seconds of battery life when at full charge, or –1 if full battery lifetime is unknown or if the device is connected to AC power.
     * @type {Integer}
     */
    BatteryFullLifeTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
