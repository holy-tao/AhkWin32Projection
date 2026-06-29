#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Query information about graphics-pipeline activity in between calls to BeginQuery and EndQuery.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_heap_type">D3D12_QUERY_HEAP_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createqueryheap">CreateQueryHeap</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_pipeline_statistics
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_QUERY_DATA_PIPELINE_STATISTICS {
    #StructPack 8

    /**
     * Number of vertices read by input assembler.
     */
    IAVertices : Int64

    /**
     * Number of primitives read by the input assembler. This number can be different depending on the primitive topology used. For example, a triangle strip with 6 vertices will produce 4 triangles, however a triangle list with 6 vertices will produce 2 triangles.
     */
    IAPrimitives : Int64

    /**
     * Specifies the number of vertex shader invocations. Direct3D invokes the vertex shader once per vertex.
     */
    VSInvocations : Int64

    /**
     * Specifies the number of geometry shader invocations. When the geometry shader is set to NULL, this statistic may or may not increment depending on the graphics adapter.
     */
    GSInvocations : Int64

    /**
     * Specifies the number of geometry shader output primitives.
     */
    GSPrimitives : Int64

    /**
     * Number of primitives that were sent to the rasterizer. When the rasterizer is disabled, this will not increment.
     */
    CInvocations : Int64

    /**
     * Number of primitives that were rendered. This may be larger or smaller than CInvocations because after a primitive is clipped sometimes it is either broken up into more than one primitive or completely culled.
     */
    CPrimitives : Int64

    /**
     * Specifies the number of pixel shader invocations.
     */
    PSInvocations : Int64

    /**
     * Specifies the number of hull shader invocations.
     */
    HSInvocations : Int64

    /**
     * Specifies the number of domain shader invocations.
     */
    DSInvocations : Int64

    /**
     * Specifies the number of compute shader invocations.
     */
    CSInvocations : Int64

}
