#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Throughput metrics for help in understanding the performance of an application.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9bandwidthtimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_D3D9BANDWIDTHTIMINGS {
    #StructPack 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The bandwidth or maximum data transfer rate from the host CPU to the GPU. This is typically the bandwidth of the PCI or AGP bus which connects the CPU and the GPU.
     */
    MaxBandwidthUtilized : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Memory utilized percentage when uploading data from the host CPU to the GPU.
     */
    FrontEndUploadMemoryUtilizedPercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Vertex throughput percentage. This is the number of vertices processed compared to the theoretical maximum vertex processing rate.
     */
    VertexRateUtilizedPercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Triangle set-up throughput percentage. This is the number of triangles that are set up for rasterization compared to the theoretical maximum triangle set-up rate.
     */
    TriangleSetupRateUtilizedPercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Pixel fill throughput percentage. This is the number of pixels that are filled compared to the theoretical pixel fill.
     */
    FillRateUtilizedPercent : Float32

}
