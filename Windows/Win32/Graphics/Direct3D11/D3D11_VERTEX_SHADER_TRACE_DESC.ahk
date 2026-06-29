#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an instance of a vertex shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_vertex_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VERTEX_SHADER_TRACE_DESC {
    #StructPack 8

    /**
     * The invocation number of the instance of the vertex shader.
     */
    Invocation : Int64

}
