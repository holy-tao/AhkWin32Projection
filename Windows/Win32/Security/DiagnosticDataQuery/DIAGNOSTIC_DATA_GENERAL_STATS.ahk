#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This resource contains general statistics about a set of diagnostic data records.
 * @remarks
 * 
  * See our [**privacy statement**](/windows/privacy/windows-diagnostic-data) for information about diagnostic data opt-in levels.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_general_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_GENERAL_STATS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * This identifies the device's current diagnostic data opt-in level (Security = 0, Basic = 1, Enhanced = 2, and Full = 3). See remarks for more details.
     * @type {Integer}
     */
    optInLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The collective size in bytes for the diagnostic data records.
     * @type {Integer}
     */
    transcriptSizeBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The timestamp of the oldest event among the diagnostic data records.
     * @type {Integer}
     */
    oldestEventTimestamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Total number of events among the diagnostic data records within the last 24 hours.
     * @type {Integer}
     */
    totalEventCountLast24Hours {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/winprog/windows-data-types)**
     * The average number of events sent per day in this set of diagnostic data records.
     * @type {Float}
     */
    averageDailyEvents {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
