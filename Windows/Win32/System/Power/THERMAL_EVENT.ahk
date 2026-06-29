#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a thermal event.
 * @remarks
 * Drivers use the <b>THERMAL_EVENT</b> structure to specify a thermal event. By calling the <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powerreportthermalevent">PowerReportThermalEvent</a> routine, the operating system can record the thermal event in the system event log.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-thermal_event
 * @namespace Windows.Win32.System.Power
 */
export default struct THERMAL_EVENT {
    #StructPack 8

    /**
     * The current structure version level, <b>THERMAL_EVENT_VERSION</b>.
     */
    Version : UInt32

    /**
     * The size of the structure.
     */
    Size : UInt32

    /**
     * One of the thermal event values from Ntpoapi.h: <b>THERMAL_EVENT_SHUTDOWN</b>, <b>THERMAL_EVENT_HIBERNATE</b>, or <b>THERMAL_EVENT_UNSPECIFIED</b>.
     */
    Type : UInt32

    /**
     * The temperature, in tenths of a degree Kelvin, that the sensor was at after crossing the trip point (or zero if unknown).
     */
    Temperature : UInt32

    /**
     * The temperature, in tenths of a degree Kelvin, of the trip point (or zero if unknown).
     */
    TripPointTemperature : UInt32

    /**
     * A pointer to a NULL-terminated, wide-character string that identifies the sensor whose threshold was crossed.
     */
    Initiator : PWSTR

}
