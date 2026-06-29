#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_COMPUTE_SHADER_TRACE_DESC.ahk" { D3D11_COMPUTE_SHADER_TRACE_DESC }
#Import ".\D3D11_VERTEX_SHADER_TRACE_DESC.ahk" { D3D11_VERTEX_SHADER_TRACE_DESC }
#Import ".\D3D11_PIXEL_SHADER_TRACE_DESC.ahk" { D3D11_PIXEL_SHADER_TRACE_DESC }
#Import ".\D3D11_HULL_SHADER_TRACE_DESC.ahk" { D3D11_HULL_SHADER_TRACE_DESC }
#Import ".\D3D11_DOMAIN_SHADER_TRACE_DESC.ahk" { D3D11_DOMAIN_SHADER_TRACE_DESC }
#Import ".\D3D11_SHADER_TYPE.ahk" { D3D11_SHADER_TYPE }
#Import ".\D3D11_GEOMETRY_SHADER_TRACE_DESC.ahk" { D3D11_GEOMETRY_SHADER_TRACE_DESC }

/**
 * Describes a shader-trace object.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SHADER_TRACE_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_shader_type">D3D11_SHADER_TYPE</a>-typed value that identifies the type of shader that the shader-trace object describes. This member also determines which shader-trace type to use in the following union.
     */
    Type : D3D11_SHADER_TYPE

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
     */
    Flags : UInt32

    VertexShaderTraceDesc : D3D11_VERTEX_SHADER_TRACE_DESC

    static __New() {
        DefineProp(this.Prototype, 'HullShaderTraceDesc', { type: D3D11_HULL_SHADER_TRACE_DESC, offset: 8 })
        DefineProp(this.Prototype, 'DomainShaderTraceDesc', { type: D3D11_DOMAIN_SHADER_TRACE_DESC, offset: 8 })
        DefineProp(this.Prototype, 'GeometryShaderTraceDesc', { type: D3D11_GEOMETRY_SHADER_TRACE_DESC, offset: 8 })
        DefineProp(this.Prototype, 'PixelShaderTraceDesc', { type: D3D11_PIXEL_SHADER_TRACE_DESC, offset: 8 })
        DefineProp(this.Prototype, 'ComputeShaderTraceDesc', { type: D3D11_COMPUTE_SHADER_TRACE_DESC, offset: 8 })
        this.DeleteProp("__New")
    }
}
