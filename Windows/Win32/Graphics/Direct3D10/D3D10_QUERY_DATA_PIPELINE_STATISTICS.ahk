#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Query information about graphics-pipeline activity in between calls to ID3D10Asynchronous::Begin and ID3D10Asynchronous::End.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_query_data_pipeline_statistics
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_QUERY_DATA_PIPELINE_STATISTICS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of vertices read by input assembler.
     */
    IAVertices : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives read by the input assembler. This number can be different depending on the primitive topology used. For example, a triangle strip with 6 vertices will produce 4 triangles, however a triangle list with 6 vertices will produce 2 triangles.
     */
    IAPrimitives : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a vertex shader was invoked. Direct3D invokes the vertex shader once per vertex.
     */
    VSInvocations : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a geometry shader was invoked. When the geometry shader is set to <b>NULL</b>, this statistic may or may not increment depending on the hardware manufacturer.
     */
    GSInvocations : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives output by a geometry shader.
     */
    GSPrimitives : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that were sent to the rasterizer. When the rasterizer is disabled, this will not increment.
     */
    CInvocations : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that were rendered. This may be larger or smaller than CInvocations because after a primitive is clipped sometimes it is either broken up into more than one primitive or completely culled.
     */
    CPrimitives : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a pixel shader was invoked.
     */
    PSInvocations : Int64

}
