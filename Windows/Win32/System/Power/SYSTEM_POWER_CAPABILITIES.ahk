#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\BATTERY_REPORTING_SCALE.ahk" { BATTERY_REPORTING_SCALE }

/**
 * Contains information about the power capabilities of the system.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_capabilities
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_POWER_CAPABILITIES {
    #StructPack 4

    /**
     * If this member is <b>TRUE</b>, there is a system power button.
     */
    PowerButtonPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, there is a system sleep button.
     */
    SleepButtonPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, there is a lid switch.
     */
    LidPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S1</a>.
     */
    SystemS1 : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S2</a>.
     */
    SystemS2 : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S3</a>.
     */
    SystemS3 : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S4</a> (hibernation).
     */
    SystemS4 : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">power off state S5</a> (soft off).
     */
    SystemS5 : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system hibernation file is present.
     */
    HiberFilePresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports wake capabilities.
     */
    FullWake : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports video display dimming 
     *       capabilities.
     */
    VideoDimPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports APM BIOS power management 
     *       features.
     */
    ApmPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, there is an uninterruptible power supply 
     *       (UPS).
     */
    UpsPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports thermal zones.
     */
    ThermalControl : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports processor throttling.
     */
    ProcessorThrottle : BOOLEAN

    /**
     * The minimum level of system processor throttling supported, expressed as a percentage.
     */
    ProcessorMinThrottle : Int8

    /**
     * The maximum level of system processor throttling supported, expressed as a percentage.
     */
    ProcessorMaxThrottle : Int8

    /**
     * If this member is <b>TRUE</b>, the system supports the <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">hybrid sleep state</a>.
     */
    FastSystemS4 : BOOLEAN

    Hiberboot : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the platform has support for ACPI wake alarm devices.  For more details on wake alarm devices, please see the ACPI specification section 9.18.
     */
    WakeAlarmPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports the S0 low power idle model.
     */
    AoAc : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system supports allowing the removal of power to 
     *       fixed disk devices.
     */
    DiskSpinDown : BOOLEAN

    HiberFileType : Int8

    AoAcConnectivitySupported : BOOLEAN

    /**
     * Reserved.
     */
    spare3 : Int8[6]

    /**
     * If this member is <b>TRUE</b>, there are one or more batteries in the system.
     */
    SystemBatteriesPresent : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system batteries are short-term. Short-term batteries 
     *       are used in uninterruptible power supplies (UPS).
     */
    BatteriesAreShortTerm : BOOLEAN

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-battery_reporting_scale">BATTERY_REPORTING_SCALE</a> structure 
     *       that contains information about how system battery metrics are reported.
     */
    BatteryScale : BATTERY_REPORTING_SCALE[3]

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) that will generate a wake event when the system is on AC power. This 
     *       member must be one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> 
     *       enumeration type values.
     */
    AcOnLineWake : SYSTEM_POWER_STATE

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) that will generate a wake event via the lid switch. This member must be 
     *       one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration 
     *       type values.
     */
    SoftLidWake : SYSTEM_POWER_STATE

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) supported by hardware that will generate a wake event via the Real Time Clock (RTC). This 
     *       member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values. 
     * 
     * To wake the computer using the RTC, the operating system must also support waking from the sleep state the computer is in when the RTC generates the wake event. Therefore, the  effective lowest sleep state from which an RTC wake event can wake the computer is the lowest sleep state supported by the operating system that is  equal to or higher than  the  value  of <b>RtcWake</b>.  To determine  the sleep states that the operating system supports, check the   <b>SystemS1</b>, <b>SystemS2</b>, <b>SystemS3</b>, and <b>SystemS4</b> members.
     */
    RtcWake : SYSTEM_POWER_STATE

    /**
     * The minimum allowable <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system power state</a> supporting wake events. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values. Note that this state may change as different device drivers are installed on the system.
     */
    MinDeviceWakeState : SYSTEM_POWER_STATE

    /**
     * The default <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system power state</a> used if an application calls 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with 
     *       <b>LT_LOWEST_LATENCY</b>. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values.
     */
    DefaultLowLatencyWake : SYSTEM_POWER_STATE

}
