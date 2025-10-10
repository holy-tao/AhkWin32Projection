#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a clock.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mfclock_properties
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCLOCK_PROPERTIES extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The interval at which the clock correlates its clock time with the system time, in 100-nanosecond units. If the value is zero, the correlation is made whenever the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getcorrelatedtime">IMFClock::GetCorrelatedTime</a> method is called.
     * @type {Integer}
     */
    qwCorrelationRate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique identifier of the underlying device that provides the time. If two clocks have the same unique identifier, they are based on the same device. If the underlying device is not shared between two clocks, the value can be <b>GUID_NULL</b>.
     * @type {Pointer<Guid>}
     */
    guidClockId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfclock_relational_flags">MFCLOCK_RELATIONAL_FLAGS</a> enumeration.
     * @type {Integer}
     */
    dwClockFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The clock frequency in Hz. A value of <b>MFCLOCK_FREQUENCY_HNS</b> means that the clock has a frequency of 10 MHz (100-nanosecond ticks), which is the standard <a href="https://docs.microsoft.com/windows/desktop/medfound/mftime">MFTIME</a> time unit in Media Foundation. If the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getclockcharacteristics">IMFClock::GetClockCharacteristics</a> method returns the <b>MFCLOCK_CHARACTERISTICS_FLAG_FREQUENCY_10MHZ</b> flag, the value of this field must be <b>MFCLOCK_FREQUENCY_HNS</b>.
     * @type {Integer}
     */
    qwClockFrequency {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The amount of inaccuracy that may be present on the clock, in parts per billion (ppb). For example, an inaccuracy of 50 ppb means the clock might drift up to 50 seconds per billion seconds of real time. If the tolerance is not known, the value is <b>MFCLOCK_TOLERANCE_UNKNOWN</b>. This constant is equal to 50 parts per million (ppm).
     * @type {Integer}
     */
    dwClockTolerance {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The amount of jitter that may be present, in 100-nanosecond units. Jitter is the variation in the frequency due to sampling the underlying clock. Jitter does not include inaccuracies caused by drift, which is reflected in the value of <b>dwClockTolerance</b>.
     *           
     * 
     * For clocks based on a single device, the minimum jitter is the length of the tick period (the inverse of the frequency). For example, if the frequency is 10 Hz, the jitter is 0.1 second, which is 1,000,000 in <a href="https://docs.microsoft.com/windows/desktop/medfound/mftime">MFTIME</a> units. This value reflects the fact that the clock might be sampled just before the next tick, resulting in a clock time that is one period less than the actual time. If the frequency is greater than 10 MHz, the jitter should be set to 1 (the minimum value).
     *           
     * 
     * If a clock's underlying hardware device does not directly time stamp the incoming data, the jitter also includes the time required to dispatch the driver's interrupt service routine (ISR). In that case, the expected jitter should include the following values:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCLOCK_JITTER_ISR"></a><a id="mfclock_jitter_isr"></a><dl>
     * <dt><b>MFCLOCK_JITTER_ISR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Jitter due to time stamping during the device driver's ISR.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCLOCK_JITTER_DPC"></a><a id="mfclock_jitter_dpc"></a><dl>
     * <dt><b>MFCLOCK_JITTER_DPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Jitter due to time stamping during the deferred procedure call (DPC) processing.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCLOCK_JITTER_PASSIVE"></a><a id="mfclock_jitter_passive"></a><dl>
     * <dt><b>MFCLOCK_JITTER_PASSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Jitter due to dropping to normal thread execution before time stamping.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwClockJitter {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
