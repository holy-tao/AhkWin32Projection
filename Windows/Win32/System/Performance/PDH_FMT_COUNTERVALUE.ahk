#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PDH_FMT_COUNTERVALUE structure contains the computed value of the counter and its status.
 * @remarks
 * You specify the data type of the computed counter value when you call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetformattedcountervalue">PdhGetFormattedCounterValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhcalculatecounterfromrawvalue">PdhCalculateCounterFromRawValue</a> to compute the counter's value.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_FMT_COUNTERVALUE {
    #StructPack 8

    /**
     * Counter status that indicates if the counter value is valid. Check this member before using the data in a calculation or displaying its value. For a list of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/checking-pdh-interface-return-values">Checking PDH Interface Return Values</a>.
     */
    CStatus : UInt32

    longValue : Int32

    static __New() {
        DefineProp(this.Prototype, 'doubleValue', { type: Float64, offset: 8 })
        DefineProp(this.Prototype, 'largeValue', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'AnsiStringValue', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'WideStringValue', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
