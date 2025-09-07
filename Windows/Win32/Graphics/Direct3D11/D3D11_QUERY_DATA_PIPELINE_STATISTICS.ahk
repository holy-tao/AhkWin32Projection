#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Query information about graphics-pipeline activity in between calls to ID3D11DeviceContext::Begin and ID3D11DeviceContext::End.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_data_pipeline_statistics
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY_DATA_PIPELINE_STATISTICS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of vertices read by input assembler.
     * @type {Integer}
     */
    IAVertices {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives read by the input assembler. This number can be different depending on the primitive topology used. For example, a triangle strip with 6 vertices will produce 4 triangles, however a triangle list with 6 vertices will produce 2 triangles.
     * @type {Integer}
     */
    IAPrimitives {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a vertex shader was invoked. Direct3D invokes the vertex shader once per vertex.
     * @type {Integer}
     */
    VSInvocations {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a geometry shader was invoked. When the geometry shader is set to <b>NULL</b>, this statistic may or may not increment depending on the hardware manufacturer.
     * @type {Integer}
     */
    GSInvocations {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives output by a geometry shader.
     * @type {Integer}
     */
    GSPrimitives {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that were sent to the rasterizer. When the rasterizer is disabled, this will not increment.
     * @type {Integer}
     */
    CInvocations {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of primitives that were rendered. This may be larger or smaller than CInvocations because after a primitive is clipped sometimes it is either broken up into more than one primitive or completely culled.
     * @type {Integer}
     */
    CPrimitives {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a pixel shader was invoked.
     * @type {Integer}
     */
    PSInvocations {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a hull shader was invoked.
     * @type {Integer}
     */
    HSInvocations {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a domain shader was invoked.
     * @type {Integer}
     */
    DSInvocations {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of times a compute shader was invoked.
     * @type {Integer}
     */
    CSInvocations {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
