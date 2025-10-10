#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Query information about graphics-pipeline activity in between calls to BeginQuery and EndQuery.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_heap_type">D3D12_QUERY_HEAP_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createqueryheap">CreateQueryHeap</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_query_data_pipeline_statistics
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_QUERY_DATA_PIPELINE_STATISTICS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Number of vertices read by input assembler.
     * @type {Integer}
     */
    IAVertices {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of primitives read by the input assembler. This number can be different depending on the primitive topology used. For example, a triangle strip with 6 vertices will produce 4 triangles, however a triangle list with 6 vertices will produce 2 triangles.
     * @type {Integer}
     */
    IAPrimitives {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of vertex shader invocations. Direct3D invokes the vertex shader once per vertex.
     * @type {Integer}
     */
    VSInvocations {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of geometry shader invocations. When the geometry shader is set to NULL, this statistic may or may not increment depending on the graphics adapter.
     * @type {Integer}
     */
    GSInvocations {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the number of geometry shader output primitives.
     * @type {Integer}
     */
    GSPrimitives {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of primitives that were sent to the rasterizer. When the rasterizer is disabled, this will not increment.
     * @type {Integer}
     */
    CInvocations {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number of primitives that were rendered. This may be larger or smaller than CInvocations because after a primitive is clipped sometimes it is either broken up into more than one primitive or completely culled.
     * @type {Integer}
     */
    CPrimitives {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies the number of pixel shader invocations.
     * @type {Integer}
     */
    PSInvocations {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the number of hull shader invocations.
     * @type {Integer}
     */
    HSInvocations {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the number of domain shader invocations.
     * @type {Integer}
     */
    DSInvocations {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies the number of compute shader invocations.
     * @type {Integer}
     */
    CSInvocations {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
