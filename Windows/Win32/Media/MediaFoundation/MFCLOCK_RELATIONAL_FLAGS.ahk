#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines properties of a clock.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfclock_relational_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCLOCK_RELATIONAL_FLAGS{

    /**
     * Jitter values are always negative. In other words, the time returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclock-getcorrelatedtime">IMFClock::GetCorrelatedTime</a> might jitter behind the actual clock time, but will never jitter ahead of the actual time. If this flag is not present, the clock might jitter in either direction.
     * @type {Integer (Int32)}
     */
    static MFCLOCK_RELATIONAL_FLAG_JITTER_NEVER_AHEAD => 1
}
