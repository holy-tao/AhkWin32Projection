#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PDH_FMT_COUNTERVALUE.ahk

/**
 * The PDH_STATISTICS structure contains the minimum, maximum, and mean values for an array of raw counters values.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_statistics
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_STATISTICS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Format of the data. The format is specified in the <i>dwFormat</i> when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhcomputecounterstatistics">PdhComputeCounterStatistics</a>.
     * @type {Integer}
     */
    dwFormat {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of values in the array.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Minimum of the values.
     * @type {PDH_FMT_COUNTERVALUE}
     */
    min{
        get {
            if(!this.HasProp("__min"))
                this.__min := PDH_FMT_COUNTERVALUE(this.ptr + 8)
            return this.__min
        }
    }

    /**
     * Maximum of the values.
     * @type {PDH_FMT_COUNTERVALUE}
     */
    max{
        get {
            if(!this.HasProp("__max"))
                this.__max := PDH_FMT_COUNTERVALUE(this.ptr + 16)
            return this.__max
        }
    }

    /**
     * Mean of the values.
     * @type {PDH_FMT_COUNTERVALUE}
     */
    mean{
        get {
            if(!this.HasProp("__mean"))
                this.__mean := PDH_FMT_COUNTERVALUE(this.ptr + 24)
            return this.__mean
        }
    }
}
