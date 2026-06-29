#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This resource contains general statistics about a set of diagnostic data records.
 * @remarks
 * See our [**privacy statement**](/windows/privacy/windows-diagnostic-data) for information about diagnostic data opt-in levels.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_general_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_GENERAL_STATS {
    #StructPack 8

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * This identifies the device's current diagnostic data opt-in level (Security = 0, Basic = 1, Enhanced = 2, and Full = 3). See remarks for more details.
     */
    optInLevel : UInt32

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The collective size in bytes for the diagnostic data records.
     */
    transcriptSizeBytes : Int64

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The timestamp of the oldest event among the diagnostic data records.
     */
    oldestEventTimestamp : Int64

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Total number of events among the diagnostic data records within the last 24 hours.
     */
    totalEventCountLast24Hours : UInt32

    /**
     * Type: **[FLOAT](/windows/desktop/winprog/windows-data-types)**
     * The average number of events sent per day in this set of diagnostic data records.
     */
    averageDailyEvents : Float32

}
