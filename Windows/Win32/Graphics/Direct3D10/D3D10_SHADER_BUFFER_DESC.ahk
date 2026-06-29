#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_CBUFFER_TYPE.ahk" { D3D_CBUFFER_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader constant-buffer. (D3D10_SHADER_BUFFER_DESC)
 * @remarks
 * Constants are supplied to shaders in a shader-constant buffer. Get the description of a shader-constant-buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getdesc">ID3D10ShaderReflectionConstantBuffer::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_BUFFER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the buffer.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb204899(v=vs.85)">D3D10_CBUFFER_TYPE</a></b>
     * 
     * The intended use of the constant data. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb204899(v=vs.85)">D3D10_CBUFFER_TYPE</a>.
     */
    Type : D3D_CBUFFER_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of unique variables.
     */
    Variables : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Buffer size (in bytes).
     */
    Size : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader buffer properties. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags">D3D10_SHADER_CBUFFER_FLAGS</a>.
     */
    uFlags : UInt32

}
