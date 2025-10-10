#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the days of the week on which to run the data collector set.
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-weekdays
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class WeekDays{

    /**
     * Run only once on the specified start date and time.
     * @type {Integer (Int32)}
     */
    static plaRunOnce => 0

    /**
     * Run on Sunday.
     * @type {Integer (Int32)}
     */
    static plaSunday => 1

    /**
     * Run on Monday.
     * @type {Integer (Int32)}
     */
    static plaMonday => 2

    /**
     * Run on Tuesday.
     * @type {Integer (Int32)}
     */
    static plaTuesday => 4

    /**
     * Run on Wednesday
     * @type {Integer (Int32)}
     */
    static plaWednesday => 8

    /**
     * Run on Thursday.
     * @type {Integer (Int32)}
     */
    static plaThursday => 16

    /**
     * Run on Friday.
     * @type {Integer (Int32)}
     */
    static plaFriday => 32

    /**
     * Run on Saturday.
     * @type {Integer (Int32)}
     */
    static plaSaturday => 64

    /**
     * Run every day of the week.
     * @type {Integer (Int32)}
     */
    static plaEveryday => 127
}
