#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\BATTERY_REPORTING_SCALE.ahk

/**
 * Contains information about the power capabilities of the system.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-system_power_capabilities
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
    PowerButtonPresent{
        get {
            if(!this.HasProp("__PowerButtonPresent"))
                this.__PowerButtonPresent := BOOLEAN(this.ptr + 0)
            return this.__PowerButtonPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, there is a system sleep button.
     * @type {BOOLEAN}
     */
    SleepButtonPresent{
        get {
            if(!this.HasProp("__SleepButtonPresent"))
                this.__SleepButtonPresent := BOOLEAN(this.ptr + 1)
            return this.__SleepButtonPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, there is a lid switch.
     * @type {BOOLEAN}
     */
    LidPresent{
        get {
            if(!this.HasProp("__LidPresent"))
                this.__LidPresent := BOOLEAN(this.ptr + 2)
            return this.__LidPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S1</a>.
     * @type {BOOLEAN}
     */
    SystemS1{
        get {
            if(!this.HasProp("__SystemS1"))
                this.__SystemS1 := BOOLEAN(this.ptr + 3)
            return this.__SystemS1
        }
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S2</a>.
     * @type {BOOLEAN}
     */
    SystemS2{
        get {
            if(!this.HasProp("__SystemS2"))
                this.__SystemS2 := BOOLEAN(this.ptr + 4)
            return this.__SystemS2
        }
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S3</a>.
     * @type {BOOLEAN}
     */
    SystemS3{
        get {
            if(!this.HasProp("__SystemS3"))
                this.__SystemS3 := BOOLEAN(this.ptr + 5)
            return this.__SystemS3
        }
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">sleep state S4</a> (hibernation).
     * @type {BOOLEAN}
     */
    SystemS4{
        get {
            if(!this.HasProp("__SystemS4"))
                this.__SystemS4 := BOOLEAN(this.ptr + 6)
            return this.__SystemS4
        }
    }

    /**
     * If this member is <b>TRUE</b>, the operating system supports <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">power off state S5</a> (soft off).
     * @type {BOOLEAN}
     */
    SystemS5{
        get {
            if(!this.HasProp("__SystemS5"))
                this.__SystemS5 := BOOLEAN(this.ptr + 7)
            return this.__SystemS5
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system hibernation file is present.
     * @type {BOOLEAN}
     */
    HiberFilePresent{
        get {
            if(!this.HasProp("__HiberFilePresent"))
                this.__HiberFilePresent := BOOLEAN(this.ptr + 8)
            return this.__HiberFilePresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports wake capabilities.
     * @type {BOOLEAN}
     */
    FullWake{
        get {
            if(!this.HasProp("__FullWake"))
                this.__FullWake := BOOLEAN(this.ptr + 9)
            return this.__FullWake
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports video display dimming 
     *       capabilities.
     * @type {BOOLEAN}
     */
    VideoDimPresent{
        get {
            if(!this.HasProp("__VideoDimPresent"))
                this.__VideoDimPresent := BOOLEAN(this.ptr + 10)
            return this.__VideoDimPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports APM BIOS power management 
     *       features.
     * @type {BOOLEAN}
     */
    ApmPresent{
        get {
            if(!this.HasProp("__ApmPresent"))
                this.__ApmPresent := BOOLEAN(this.ptr + 11)
            return this.__ApmPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, there is an uninterruptible power supply 
     *       (UPS).
     * @type {BOOLEAN}
     */
    UpsPresent{
        get {
            if(!this.HasProp("__UpsPresent"))
                this.__UpsPresent := BOOLEAN(this.ptr + 12)
            return this.__UpsPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports thermal zones.
     * @type {BOOLEAN}
     */
    ThermalControl{
        get {
            if(!this.HasProp("__ThermalControl"))
                this.__ThermalControl := BOOLEAN(this.ptr + 13)
            return this.__ThermalControl
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports processor throttling.
     * @type {BOOLEAN}
     */
    ProcessorThrottle{
        get {
            if(!this.HasProp("__ProcessorThrottle"))
                this.__ProcessorThrottle := BOOLEAN(this.ptr + 14)
            return this.__ProcessorThrottle
        }
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
    FastSystemS4{
        get {
            if(!this.HasProp("__FastSystemS4"))
                this.__FastSystemS4 := BOOLEAN(this.ptr + 17)
            return this.__FastSystemS4
        }
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    Hiberboot{
        get {
            if(!this.HasProp("__Hiberboot"))
                this.__Hiberboot := BOOLEAN(this.ptr + 18)
            return this.__Hiberboot
        }
    }

    /**
     * If this member is <b>TRUE</b>, the platform has support for ACPI wake alarm devices.  For more details on wake alarm devices, please see the ACPI specification section 9.18.
     * @type {BOOLEAN}
     */
    WakeAlarmPresent{
        get {
            if(!this.HasProp("__WakeAlarmPresent"))
                this.__WakeAlarmPresent := BOOLEAN(this.ptr + 19)
            return this.__WakeAlarmPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports the S0 low power idle model.
     * @type {BOOLEAN}
     */
    AoAc{
        get {
            if(!this.HasProp("__AoAc"))
                this.__AoAc := BOOLEAN(this.ptr + 20)
            return this.__AoAc
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system supports allowing the removal of power to 
     *       fixed disk devices.
     * @type {BOOLEAN}
     */
    DiskSpinDown{
        get {
            if(!this.HasProp("__DiskSpinDown"))
                this.__DiskSpinDown := BOOLEAN(this.ptr + 21)
            return this.__DiskSpinDown
        }
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
    AoAcConnectivitySupported{
        get {
            if(!this.HasProp("__AoAcConnectivitySupported"))
                this.__AoAcConnectivitySupported := BOOLEAN(this.ptr + 23)
            return this.__AoAcConnectivitySupported
        }
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
    SystemBatteriesPresent{
        get {
            if(!this.HasProp("__SystemBatteriesPresent"))
                this.__SystemBatteriesPresent := BOOLEAN(this.ptr + 30)
            return this.__SystemBatteriesPresent
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system batteries are short-term. Short-term batteries 
     *       are used in uninterruptible power supplies (UPS).
     * @type {BOOLEAN}
     */
    BatteriesAreShortTerm{
        get {
            if(!this.HasProp("__BatteriesAreShortTerm"))
                this.__BatteriesAreShortTerm := BOOLEAN(this.ptr + 31)
            return this.__BatteriesAreShortTerm
        }
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
