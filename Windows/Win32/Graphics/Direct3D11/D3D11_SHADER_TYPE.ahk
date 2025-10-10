#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a shader type for tracing.
 * @remarks
 * 
  * <b>D3D11_SHADER_TYPE</b> identifies the type of shader in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc">D3D11_SHADER_TRACE_DESC</a> structure.
  * 
  * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/ne-d3d11shadertracing-d3d11_shader_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_TYPE{

    /**
     * Identifies a vertex shader.
     * @type {Integer (Int32)}
     */
    static D3D11_VERTEX_SHADER => 1

    /**
     * Identifies a hull shader.
     * @type {Integer (Int32)}
     */
    static D3D11_HULL_SHADER => 2

    /**
     * Identifies a domain shader.
     * @type {Integer (Int32)}
     */
    static D3D11_DOMAIN_SHADER => 3

    /**
     * Identifies a geometry shader.
     * @type {Integer (Int32)}
     */
    static D3D11_GEOMETRY_SHADER => 4

    /**
     * Identifies a pixel shader.
     * @type {Integer (Int32)}
     */
    static D3D11_PIXEL_SHADER => 5

    /**
     * Identifies a compute shader.
     * @type {Integer (Int32)}
     */
    static D3D11_COMPUTE_SHADER => 6
}
