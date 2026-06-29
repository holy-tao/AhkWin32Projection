#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Percent of time processing shader data.
 * @remarks
 * For best performance, a balanced load is recommended.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9stagetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_D3D9STAGETIMINGS {
    #StructPack 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time in shader spent on memory accesses.
     */
    MemoryProcessingPercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time processing (moving data around in registers or doing mathematical operations).
     */
    ComputationProcessingPercent : Float32

}
