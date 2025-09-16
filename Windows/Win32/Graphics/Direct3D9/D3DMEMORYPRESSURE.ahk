#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure contains data for memory pressure reporting.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dmemorypressure
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMEMORYPRESSURE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of bytes that were evicted by the process during the duration of the query.
     * @type {Integer}
     */
    BytesEvictedFromProcess {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of bytes placed in nonoptimal memory segments, due to inadequate space within the preferred memory segments.
     * @type {Integer}
     */
    SizeOfInefficientAllocation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The overall efficiency of the memory allocations that were placed in nonoptimal memory. The value is expressed as a percentage. For example, the value 95 indicates that the allocations placed in nonpreferred memory segments are 95% efficient. This number should not be considered an exact measurement.
     * @type {Integer}
     */
    LevelOfEfficiency {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
