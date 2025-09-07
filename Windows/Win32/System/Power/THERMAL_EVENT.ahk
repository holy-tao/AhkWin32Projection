#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a thermal event.
 * @remarks
 * Drivers use the <b>THERMAL_EVENT</b> structure to specify a thermal event. By calling the <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powerreportthermalevent">PowerReportThermalEvent</a> routine, the operating system can record the thermal event in the system event log.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-thermal_event
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class THERMAL_EVENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The current structure version level, <b>THERMAL_EVENT_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One of the thermal event values from Ntpoapi.h: <b>THERMAL_EVENT_SHUTDOWN</b>, <b>THERMAL_EVENT_HIBERNATE</b>, or <b>THERMAL_EVENT_UNSPECIFIED</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The temperature, in tenths of a degree Kelvin, that the sensor was at after crossing the trip point (or zero if unknown).
     * @type {Integer}
     */
    Temperature {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The temperature, in tenths of a degree Kelvin, of the trip point (or zero if unknown).
     * @type {Integer}
     */
    TripPointTemperature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a NULL-terminated, wide-character string that identifies the sensor whose threshold was crossed.
     * @type {Pointer<Ptr>}
     */
    Initiator {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
