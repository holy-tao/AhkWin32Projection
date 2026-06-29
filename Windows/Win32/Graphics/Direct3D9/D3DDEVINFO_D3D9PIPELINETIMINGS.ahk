#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Percent of time processing data in the pipeline.
 * @remarks
 * For best performance, a balanced load is recommended.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9pipelinetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_D3D9PIPELINETIMINGS {
    #StructPack 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent running vertex shaders.
     */
    VertexProcessingTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent running pixel shaders.
     */
    PixelProcessingTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent doing other processing.
     */
    OtherGPUProcessingTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time not processing anything.
     */
    GPUIdleTimePercent : Float32

}
