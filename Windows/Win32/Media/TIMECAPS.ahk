#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TIMECAPS structure contains information about the resolution of the timer.
 * @see https://learn.microsoft.com/windows/win32/api/timeapi/ns-timeapi-timecaps
 * @namespace Windows.Win32.Media
 */
export default struct TIMECAPS {
    #StructPack 4

    /**
     * The minimum supported resolution, in milliseconds.
     */
    wPeriodMin : UInt32

    /**
     * The maximum supported resolution, in milliseconds.
     */
    wPeriodMax : UInt32

}
