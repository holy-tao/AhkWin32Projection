#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an instance of a vertex shader to trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_vertex_shader_trace_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VERTEX_SHADER_TRACE_DESC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The invocation number of the instance of the vertex shader.
     * @type {Integer}
     */
    Invocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
