#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the source of the performance counter data.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-datasourcetypeconstants
 * @namespace Windows.Win32.System.Performance
 */
class DataSourceTypeConstants extends Win32Enum {

    /**
     * No data source.
     * @type {Integer (Int32)}
     */
    static sysmonNullDataSource => -1

    /**
     * The data source is the current activity of the performance counters on the local or remote computer as specified in the performance counter paths.
     * @type {Integer (Int32)}
     */
    static sysmonCurrentActivity => 1

    /**
     * The data source is one or more log files.
     * @type {Integer (Int32)}
     */
    static sysmonLogFiles => 2

    /**
     * The data source is an SQL log.
     * @type {Integer (Int32)}
     */
    static sysmonSqlLog => 3
}
