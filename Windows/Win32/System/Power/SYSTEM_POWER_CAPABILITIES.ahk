#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BATTERY_REPORTING_SCALE.ahk

/**
 * Contains information about the power capabilities of the system.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_capabilities
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_POWER_CAPABILITIES extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * If this member is <b>TRUE</b>, there is a system power button.
     * @type {BOOLEAN}
     */
    PowerButtonPresent {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, there is a system sleep button.
     * @type {BOOLEAN}
     */
    SleepButtonPresent {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * If this member is <b>TRUE</b>, there is a lid switch.
     * @type {BOOLEAN}
     */
    LidPresent {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S1</a>.
     * @type {BOOLEAN}
     */
    SystemS1 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S2</a>.
     * @type {BOOLEAN}
     */
    SystemS2 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S3</a>.
     * @type {BOOLEAN}
     */
    SystemS3 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S4</a> (hibernation).
     * @type {BOOLEAN}
     */
    SystemS4 {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">power off state S5</a> (soft off).
     * @type {BOOLEAN}
     */
    SystemS5 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * If this member is <b>TRUE</b>, the system hibernation file is present.
     * @type {BOOLEAN}
     */
    HiberFilePresent {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports wake capabilities.
     * @type {BOOLEAN}
     */
    FullWake {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports video display dimming 
     *       capabilities.
     * @type {BOOLEAN}
     */
    VideoDimPresent {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports APM BIOS power management 
     *       features.
     * @type {BOOLEAN}
     */
    ApmPresent {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * If this member is <b>TRUE</b>, there is an uninterruptible power supply 
     *       (UPS).
     * @type {BOOLEAN}
     */
    UpsPresent {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports thermal zones.
     * @type {BOOLEAN}
     */
    ThermalControl {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports processor throttling.
     * @type {BOOLEAN}
     */
    ProcessorThrottle {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * The minimum level of system processor throttling supported, expressed as a percentage.
     * @type {Integer}
     */
    ProcessorMinThrottle {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * The maximum level of system processor throttling supported, expressed as a percentage.
     * @type {Integer}
     */
    ProcessorMaxThrottle {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports the <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">hybrid sleep state</a>.
     * @type {BOOLEAN}
     */
    FastSystemS4 {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    Hiberboot {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * If this member is <b>TRUE</b>, the platform has support for ACPI wake alarm devices.  For more details on wake alarm devices, please see the ACPI specification section 9.18.
     * @type {BOOLEAN}
     */
    WakeAlarmPresent {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports the S0 low power idle model.
     * @type {BOOLEAN}
     */
    AoAc {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * If this member is <b>TRUE</b>, the system supports allowing the removal of power to 
     *       fixed disk devices.
     * @type {BOOLEAN}
     */
    DiskSpinDown {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * 
     * @type {Integer}
     */
    HiberFileType {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    AoAcConnectivitySupported {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    spare3{
        get {
            if(!this.HasProp("__spare3ProxyArray"))
                this.__spare3ProxyArray := Win32FixedArray(this.ptr + 24, 6, Primitive, "char")
            return this.__spare3ProxyArray
        }
    }

    /**
     * If this member is <b>TRUE</b>, there are one or more batteries in the system.
     * @type {BOOLEAN}
     */
    SystemBatteriesPresent {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * If this member is <b>TRUE</b>, the system batteries are short-term. Short-term batteries 
     *       are used in uninterruptible power supplies (UPS).
     * @type {BOOLEAN}
     */
    BatteriesAreShortTerm {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-battery_reporting_scale">BATTERY_REPORTING_SCALE</a> structure 
     *       that contains information about how system battery metrics are reported.
     * @type {Array<BATTERY_REPORTING_SCALE>}
     */
    BatteryScale{
        get {
            if(!this.HasProp("__BatteryScaleProxyArray"))
                this.__BatteryScaleProxyArray := Win32FixedArray(this.ptr + 32, 3, BATTERY_REPORTING_SCALE, "")
            return this.__BatteryScaleProxyArray
        }
    }

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) that will generate a wake event when the system is on AC power. This 
     *       member must be one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> 
     *       enumeration type values.
     * @type {Integer}
     */
    AcOnLineWake {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) that will generate a wake event via the lid switch. This member must be 
     *       one of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration 
     *       type values.
     * @type {Integer}
     */
    SoftLidWake {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * The lowest <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system sleep state</a> (Sx) supported by hardware that will generate a wake event via the Real Time Clock (RTC). This 
     *       member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values. 
     * 
     * To wake the computer using the RTC, the operating system must also support waking from the sleep state the computer is in when the RTC generates the wake event. Therefore, the  effective lowest sleep state from which an RTC wake event can wake the computer is the lowest sleep state supported by the operating system that is  equal to or higher than  the  value  of <b>RtcWake</b>.  To determine  the sleep states that the operating system supports, check the   <b>SystemS1</b>, <b>SystemS2</b>, <b>SystemS3</b>, and <b>SystemS4</b> members.
     * @type {Integer}
     */
    RtcWake {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * The minimum allowable <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system power state</a> supporting wake events. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values. Note that this state may change as different device drivers are installed on the system.
     * @type {Integer}
     */
    MinDeviceWakeState {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * The default <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">system power state</a> used if an application calls 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with 
     *       <b>LT_LOWEST_LATENCY</b>. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type 
     *       values.
     * @type {Integer}
     */
    DefaultLowLatencyWake {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
