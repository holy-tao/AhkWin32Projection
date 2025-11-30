#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe the characteristics of a clock.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfclock_characteristics_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCLOCK_CHARACTERISTICS_FLAGS extends Win32Enum{

    /**
     * The clock times returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getcorrelatedtime">IMFClock::GetCorrelatedTime</a> method are in units of 100 nanoseconds. If this flag is absent, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getproperties">IMFClock::GetProperties</a> to get the clock frequency. The clock frequency is given in the <b>qwClockFrequency</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfclock_properties">MFCLOCK_PROPERTIES</a> structure returned by that method.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_CHARACTERISTICS_FLAG_FREQUENCY_10MHZ => 2

    /**
     * The clock is always running. If this flag is present, the clock cannot be paused or stopped. If this flag is absent, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getstate">IMFClock::GetState</a> method to get the current state.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_CHARACTERISTICS_FLAG_ALWAYS_RUNNING => 4

    /**
     * The clock times are generated from the system clock.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_CHARACTERISTICS_FLAG_IS_SYSTEM_CLOCK => 8
}
