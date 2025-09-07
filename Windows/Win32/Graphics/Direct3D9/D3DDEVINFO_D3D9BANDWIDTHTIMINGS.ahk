#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Throughput metrics for help in understanding the performance of an application.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9bandwidthtimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9BANDWIDTHTIMINGS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The bandwidth or maximum data transfer rate from the host CPU to the GPU. This is typically the bandwidth of the PCI or AGP bus which connects the CPU and the GPU.
     * @type {Float}
     */
    MaxBandwidthUtilized {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Memory utilized percentage when uploading data from the host CPU to the GPU.
     * @type {Float}
     */
    FrontEndUploadMemoryUtilizedPercent {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Vertex throughput percentage. This is the number of vertices processed compared to the theoretical maximum vertex processing rate.
     * @type {Float}
     */
    VertexRateUtilizedPercent {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Triangle set-up throughput percentage. This is the number of triangles that are set up for rasterization compared to the theoretical maximum triangle set-up rate.
     * @type {Float}
     */
    TriangleSetupRateUtilizedPercent {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Pixel fill throughput percentage. This is the number of pixels that are filled compared to the theoretical pixel fill.
     * @type {Float}
     */
    FillRateUtilizedPercent {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
