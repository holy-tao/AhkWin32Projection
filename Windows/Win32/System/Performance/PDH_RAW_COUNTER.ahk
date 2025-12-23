#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The PDH_RAW_COUNTER structure returns the data as it was collected from the counter provider. No translation, formatting, or other interpretation is performed on the data.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_RAW_COUNTER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Counter status that indicates if the counter value is valid. Check this member before using the data in a calculation or displaying its value. For a list of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/checking-pdh-interface-return-values">Checking PDH Interface Return Values</a>.
     * @type {Integer}
     */
    CStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Local time for when the data was collected, in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     * @type {FILETIME}
     */
    TimeStamp{
        get {
            if(!this.HasProp("__TimeStamp"))
                this.__TimeStamp := FILETIME(4, this)
            return this.__TimeStamp
        }
    }

    /**
     * First raw counter value.
     * @type {Integer}
     */
    FirstValue {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Second raw counter value. Rate counters require two values in order to compute a displayable value.
     * @type {Integer}
     */
    SecondValue {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * If the counter type contains the PERF_MULTI_COUNTER flag, this member contains the additional counter data used in the calculation. For example, the PERF_100NSEC_MULTI_TIMER counter type contains the PERF_MULTI_COUNTER flag.
     * @type {Integer}
     */
    MultiCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
