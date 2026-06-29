#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PDH_FMT_COUNTERVALUE.ahk" { PDH_FMT_COUNTERVALUE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PDH_STATISTICS structure contains the minimum, maximum, and mean values for an array of raw counters values.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_statistics
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_STATISTICS {
    #StructPack 8

    /**
     * Format of the data. The format is specified in the <i>dwFormat</i> when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhcomputecounterstatistics">PdhComputeCounterStatistics</a>.
     */
    dwFormat : UInt32

    /**
     * Number of values in the array.
     */
    count : UInt32

    /**
     * Minimum of the values.
     */
    min : PDH_FMT_COUNTERVALUE

    /**
     * Maximum of the values.
     */
    max : PDH_FMT_COUNTERVALUE

    /**
     * Mean of the values.
     */
    mean : PDH_FMT_COUNTERVALUE

}
