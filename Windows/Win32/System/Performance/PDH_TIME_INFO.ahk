#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_TIME_INFO structure contains information on time intervals as applied to the sampling of performance data.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_time_info
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_TIME_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Starting time of the sample interval, in local <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Ending time of the sample interval, in local <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Number of samples collected during the interval.
     * @type {Integer}
     */
    SampleCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
