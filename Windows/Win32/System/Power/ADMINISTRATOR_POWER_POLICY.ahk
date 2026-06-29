#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }

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
 */
export default struct ADMINISTRATOR_POWER_POLICY {
    #StructPack 4

    /**
     * The minimum system power sleep state. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values between 
     *       <b>PowerSystemSleeping1</b> (power state S1) and 
     *       <b>PowerSystemHibernate</b> (power state S4).
     */
    MinSleep : SYSTEM_POWER_STATE

    /**
     * The maximum system power sleep state. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values between 
     *       <b>PowerSystemSleeping1</b> (power state S1) and 
     *       <b>PowerSystemHibernate</b> (power state S4).
     */
    MaxSleep : SYSTEM_POWER_STATE

    /**
     * The minimum allowable video idle time-out before turning the display device off, in seconds.
     */
    MinVideoTimeout : UInt32

    /**
     * The maximum allowable video idle time-out before turning the display device off, in seconds.
     */
    MaxVideoTimeout : UInt32

    /**
     * The minimum allowable disk idle time before flushing the cache manager and spinning down a hard disk 
     *       device, in seconds.
     */
    MinSpindownTimeout : UInt32

    /**
     * The maximum allowable disk idle time before flushing the cache manager and spinning down a hard disk 
     *       device, in seconds.
     */
    MaxSpindownTimeout : UInt32

}
