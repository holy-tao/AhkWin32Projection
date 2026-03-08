#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PDH_FMT_COUNTERVALUE structure contains the computed value of the counter and its status.
 * @remarks
 * You specify the data type of the computed counter value when you call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetformattedcountervalue">PdhGetFormattedCounterValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhcalculatecounterfromrawvalue">PdhCalculateCounterFromRawValue</a> to compute the counter's value.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_FMT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_DOUBLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LARGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LONG => 256
}
