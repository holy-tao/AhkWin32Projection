#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_FMT_COUNTERVALUE structure contains the computed value of the counter and its status.
 * @remarks
 * 
  * You specify the data type of the computed counter value when you call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetformattedcountervalue">PdhGetFormattedCounterValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhcalculatecounterfromrawvalue">PdhCalculateCounterFromRawValue</a> to compute the counter's value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pdh/ns-pdh-pdh_fmt_countervalue
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_FMT_COUNTERVALUE extends Win32Struct
{
    static sizeof => 16

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
     * @type {Integer}
     */
    longValue {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Float}
     */
    doubleValue {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    largeValue {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    AnsiStringValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    WideStringValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
