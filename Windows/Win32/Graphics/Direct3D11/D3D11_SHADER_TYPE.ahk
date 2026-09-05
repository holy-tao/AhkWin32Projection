#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a shader type for tracing.
 * @remarks
 * <b>D3D11_SHADER_TYPE</b> identifies the type of shader in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc">D3D11_SHADER_TRACE_DESC</a> structure.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_shader_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_SHADER_TYPE extends Win32Enum {

    /**
     * Identifies a vertex shader.
     * Native name: D3D11_VERTEX_SHADER
     * @type {Integer (Int32)}
     */
    static VERTEX_SHADER => 1

    /**
     * Identifies a hull shader.
     * Native name: D3D11_HULL_SHADER
     * @type {Integer (Int32)}
     */
    static HULL_SHADER => 2

    /**
     * Identifies a domain shader.
     * Native name: D3D11_DOMAIN_SHADER
     * @type {Integer (Int32)}
     */
    static DOMAIN_SHADER => 3

    /**
     * Identifies a geometry shader.
     * Native name: D3D11_GEOMETRY_SHADER
     * @type {Integer (Int32)}
     */
    static GEOMETRY_SHADER => 4

    /**
     * Identifies a pixel shader.
     * Native name: D3D11_PIXEL_SHADER
     * @type {Integer (Int32)}
     */
    static PIXEL_SHADER => 5

    /**
     * Identifies a compute shader.
     * Native name: D3D11_COMPUTE_SHADER
     * @type {Integer (Int32)}
     */
    static COMPUTE_SHADER => 6
}
