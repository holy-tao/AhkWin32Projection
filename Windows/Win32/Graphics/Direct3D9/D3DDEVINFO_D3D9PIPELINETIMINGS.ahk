#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Percent of time processing data in the pipeline.
 * @remarks
 * For best performance, a balanced load is recommended.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9pipelinetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9PIPELINETIMINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent running vertex shaders.
     * @type {Float}
     */
    VertexProcessingTimePercent {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent running pixel shaders.
     * @type {Float}
     */
    PixelProcessingTimePercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time spent doing other processing.
     * @type {Float}
     */
    OtherGPUProcessingTimePercent {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percent of time not processing anything.
     * @type {Float}
     */
    GPUIdleTimePercent {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
