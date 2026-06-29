#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The PDH_RAW_COUNTER structure returns the data as it was collected from the counter provider. No translation, formatting, or other interpretation is performed on the data.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_RAW_COUNTER {
    #StructPack 8

    /**
     * Counter status that indicates if the counter value is valid. Check this member before using the data in a calculation or displaying its value. For a list of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/checking-pdh-interface-return-values">Checking PDH Interface Return Values</a>.
     */
    CStatus : UInt32

    /**
     * Local time for when the data was collected, in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     */
    TimeStamp : FILETIME

    /**
     * First raw counter value.
     */
    FirstValue : Int64

    /**
     * Second raw counter value. Rate counters require two values in order to compute a displayable value.
     */
    SecondValue : Int64

    /**
     * If the counter type contains the PERF_MULTI_COUNTER flag, this member contains the additional counter data used in the calculation. For example, the PERF_100NSEC_MULTI_TIMER counter type contains the PERF_MULTI_COUNTER flag.
     */
    MultiCount : UInt32

}
