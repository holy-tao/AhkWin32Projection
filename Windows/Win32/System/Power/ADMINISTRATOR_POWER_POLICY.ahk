#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the administrator override power policy settings.
 * @remarks
 * The <b>ADMINISTRATOR_POWER_POLICY</b> 
 *     structure defines limits to certain power policy values that are applied globally to all users' power schemes. The 
 *     values in the <b>ADMINISTRATOR_POWER_POLICY</b> 
 *     structure override any settings selected by the user in the Power Options control panel program.
 * 
 * To set an administrator override policy, call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/powerbase/nf-powerbase-callntpowerinformation">CallNtPowerInformation</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-administrator_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class ADMINISTRATOR_POWER_POLICY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The minimum system power sleep state. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values between 
     *       <b>PowerSystemSleeping1</b> (power state S1) and 
     *       <b>PowerSystemHibernate</b> (power state S4).
     * @type {Integer}
     */
    MinSleep {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum system power sleep state. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values between 
     *       <b>PowerSystemSleeping1</b> (power state S1) and 
     *       <b>PowerSystemHibernate</b> (power state S4).
     * @type {Integer}
     */
    MaxSleep {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The minimum allowable video idle time-out before turning the display device off, in seconds.
     * @type {Integer}
     */
    MinVideoTimeout {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum allowable video idle time-out before turning the display device off, in seconds.
     * @type {Integer}
     */
    MaxVideoTimeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The minimum allowable disk idle time before flushing the cache manager and spinning down a hard disk 
     *       device, in seconds.
     * @type {Integer}
     */
    MinSpindownTimeout {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The maximum allowable disk idle time before flushing the cache manager and spinning down a hard disk 
     *       device, in seconds.
     * @type {Integer}
     */
    MaxSpindownTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
