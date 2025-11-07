#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines how the performance counter data is graphed, for example, as a line graph or a histogram.
 * @remarks
 * 
 * The following enumeration values were introduced in Windows Vista.
 * 
 * <ul>
 * <li><b>sysmonChartArea</b></li>
 * <li><b>sysmonChartStackedArea</b></li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//isysmon/ne-isysmon-displaytypeconstants
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DisplayTypeConstants{

    /**
     * Counter values are displayed in a line graph. Each marker on the line graph represents a data value.
     * @type {Integer (Int32)}
     */
    static sysmonLineGraph => 1

    /**
     * Counter values are displayed as a histogram.
     * @type {Integer (Int32)}
     */
    static sysmonHistogram => 2

    /**
     * Counter values are displayed in a report format. Only the current value for each counter is displayed.
     * @type {Integer (Int32)}
     */
    static sysmonReport => 3

    /**
     * Counter values are displayed as a line graph. The area between the line and the x-axis is shaded. You can only use this option if the source of the counter data is a log file.
     * @type {Integer (Int32)}
     */
    static sysmonChartArea => 4

    /**
     * Counter values are displayed as a line graph. The line graph for each counter is stacked one upon the other. The area between the line and the x-axis or adjacent counter is shaded. You can only use this option if the source of the counter data is a log file.
 * 
 * If the sum of all the counter values exceeds the maximum scale value of the graph, SYSMON uses an appropriate scale value for each counter in order to fit the counters within the maximum scale value of the graph.
     * @type {Integer (Int32)}
     */
    static sysmonChartStackedArea => 5
}
