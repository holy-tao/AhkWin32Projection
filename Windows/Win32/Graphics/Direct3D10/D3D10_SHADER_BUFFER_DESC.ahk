#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader constant-buffer.
 * @remarks
 * 
 * Constants are supplied to shaders in a shader-constant buffer. Get the description of a shader-constant-buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getdesc">ID3D10ShaderReflectionConstantBuffer::GetDesc</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/ns-d3d10shader-d3d10_shader_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_BUFFER_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the buffer.
     * @type {PSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb204899(v=vs.85)">D3D10_CBUFFER_TYPE</a></b>
     * 
     * The intended use of the constant data. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb204899(v=vs.85)">D3D10_CBUFFER_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of unique variables.
     * @type {Integer}
     */
    Variables {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Buffer size (in bytes).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader buffer properties. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags">D3D10_SHADER_CBUFFER_FLAGS</a>.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
