#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines if the Histogram and Report views graph the last value sampled or a calculated value using values from the sampling period, such as the average or minimum value.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-reportvaluetypeconstants
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ReportValueTypeConstants extends Win32Enum{

    /**
     * The value displayed depends on the source of the counter data. If the source of the counter data is from the current activity of the computer, <b>sysmonCurrentValue</b> is used. If the source of the counter data is a log file, <b>sysmonAverage</b> is used.
     * @type {Integer (Int32)}
     */
    static sysmonDefaultValue => 0

    /**
     * The current value of the counter.
     * @type {Integer (Int32)}
     */
    static sysmonCurrentValue => 1

    /**
     * The average value of the counter over the sampling period.
     * @type {Integer (Int32)}
     */
    static sysmonAverage => 2

    /**
     * The minimum value of the counter over the sampling period.
     * @type {Integer (Int32)}
     */
    static sysmonMinimum => 3

    /**
     * The maximum value of the counter over the sampling period.
     * @type {Integer (Int32)}
     */
    static sysmonMaximum => 4
}
