#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies date and time information for transitions between standard time and daylight saving time.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_systemtime
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SYSTEMTIME {
    #StructPack 2

    /**
     * The year from 1601 to 30827.
     */
    wYear : UInt16

    wMonth : UInt16

    wDayOfWeek : UInt16

    /**
     * The day of the month when the transition occurs.
     */
    wDay : UInt16

    /**
     * The hour when the transition occurs.
     */
    wHour : UInt16

    /**
     * The minute when the transition occurs.
     */
    wMinute : UInt16

    /**
     * The second when the transition occurs.
     */
    wSecond : UInt16

    /**
     * The millisecond when the transition occurs.
     */
    wMilliseconds : UInt16

}
