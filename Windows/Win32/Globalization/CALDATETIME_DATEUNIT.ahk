#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Deprecated. Specifies the date units for adjusting the CALDATETIME structure.
 * @see https://learn.microsoft.com/windows/win32/Intl/caldatetime-dateunit
 * @namespace Windows.Win32.Globalization
 */
export default struct CALDATETIME_DATEUNIT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static EraUnit => 0

    /**
     * @type {Integer (Int32)}
     */
    static YearUnit => 1

    /**
     * @type {Integer (Int32)}
     */
    static MonthUnit => 2

    /**
     * @type {Integer (Int32)}
     */
    static WeekUnit => 3

    /**
     * @type {Integer (Int32)}
     */
    static DayUnit => 4

    /**
     * @type {Integer (Int32)}
     */
    static HourUnit => 5

    /**
     * @type {Integer (Int32)}
     */
    static MinuteUnit => 6

    /**
     * @type {Integer (Int32)}
     */
    static SecondUnit => 7

    /**
     * @type {Integer (Int32)}
     */
    static TickUnit => 8
}
