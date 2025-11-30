#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data collector types.
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-datacollectortype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DataCollectorType extends Win32Enum{

    /**
     * Collects performance counter data. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iperformancecounterdatacollector">IPerformanceCounterDataCollector</a> interface represents this data collector.
     * @type {Integer (Int32)}
     */
    static plaPerformanceCounter => 0

    /**
     * Collects events from an event trace session. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedatacollector">ITraceDataCollector</a> interface represents this data collector.
     * @type {Integer (Int32)}
     */
    static plaTrace => 1

    /**
     * Collects computer configuration information. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iconfigurationdatacollector">IConfigurationDataCollector</a> interface represents this data collector.
     * @type {Integer (Int32)}
     */
    static plaConfiguration => 2

    /**
     * Monitors performance counters and performs actions if the counter value crosses the specified threshold. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ialertdatacollector">IAlertDataCollector</a> interface represents this data collector.
     * @type {Integer (Int32)}
     */
    static plaAlert => 3

    /**
     * Logs API calls made by the process. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iapitracingdatacollector">IApiTracingDataCollector</a> interface represents this data collector.
     * @type {Integer (Int32)}
     */
    static plaApiTrace => 4
}
