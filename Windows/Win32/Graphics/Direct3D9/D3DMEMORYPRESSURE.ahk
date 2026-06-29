#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure contains data for memory pressure reporting.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dmemorypressure
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @architecture X64, Arm64
 */
export default struct D3DMEMORYPRESSURE {
    #StructPack 8

    /**
     * The number of bytes that were evicted by the process during the duration of the query.
     */
    BytesEvictedFromProcess : Int64

    /**
     * The total number of bytes placed in nonoptimal memory segments, due to inadequate space within the preferred memory segments.
     */
    SizeOfInefficientAllocation : Int64

    /**
     * The overall efficiency of the memory allocations that were placed in nonoptimal memory. The value is expressed as a percentage. For example, the value 95 indicates that the allocations placed in nonpreferred memory segments are 95% efficient. This number should not be considered an exact measurement.
     */
    LevelOfEfficiency : UInt32

}
