#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_PIXEL_SHADER_TRACE_DESC.ahk
#Include .\D3D11_COMPUTE_SHADER_TRACE_DESC.ahk

/**
 * Describes a shader-trace object.
 * @remarks
 * 
  * This API requires the Windows Software Development Kit (SDK) for Windows 8.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_TRACE_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_shader_type">D3D11_SHADER_TYPE</a>-typed value that identifies the type of shader that the shader-trace object describes. This member also determines which shader-trace type to use in the following union.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A combination of the following flags that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertracefactory-createshadertrace">ID3D11ShaderTraceFactory::CreateShaderTrace</a> creates the shader-trace object.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_WRITES (0x1)</td>
     * <td>The shader trace object records register-writes.</td>
     * </tr>
     * <tr>
     * <td>D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_READS (0x2)</td>
     * <td>The shader trace object records register-reads.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    VertexShaderTraceDesc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    HullShaderTraceDesc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DomainShaderTraceDesc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    GeometryShaderTraceDesc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D11_PIXEL_SHADER_TRACE_DESC}
     */
    PixelShaderTraceDesc{
        get {
            if(!this.HasProp("__PixelShaderTraceDesc"))
                this.__PixelShaderTraceDesc := D3D11_PIXEL_SHADER_TRACE_DESC(this.ptr + 8)
            return this.__PixelShaderTraceDesc
        }
    }

    /**
     * @type {D3D11_COMPUTE_SHADER_TRACE_DESC}
     */
    ComputeShaderTraceDesc{
        get {
            if(!this.HasProp("__ComputeShaderTraceDesc"))
                this.__ComputeShaderTraceDesc := D3D11_COMPUTE_SHADER_TRACE_DESC(this.ptr + 8)
            return this.__ComputeShaderTraceDesc
        }
    }
}
