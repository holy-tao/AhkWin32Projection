#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Deprecated. Represents an instant in time, typically expressed as a date and time of day and a corresponding calendar.
 * @see https://learn.microsoft.com/windows/win32/Intl/caldatetime
 * @namespace Windows.Win32.Globalization
 */
export default struct CALDATETIME {
    #StructPack 4

    /**
     * The [calendar identifier](calendar-identifiers.md) for the instant in time.
     */
    CalId : UInt32

    /**
     * The era information for the instant in time.
     */
    Era : UInt32

    /**
     * The year for the instant in time.
     */
    Year : UInt32

    /**
     * The month for the instant in time.
     */
    Month : UInt32

    /**
     * The day for the instant in time.
     */
    Day : UInt32

    /**
     * The day of the week for the instant in time.
     */
    DayOfWeek : UInt32

    /**
     * The hour for the instant in time.
     */
    Hour : UInt32

    /**
     * The minute for the instant in time.
     */
    Minute : UInt32

    /**
     * The second for the instant in time.
     */
    Second : UInt32

    /**
     * The tick for the instant in time.
     */
    Tick : UInt32

}
