#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_CBUFFER_TYPE.ahk" { D3D_CBUFFER_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader constant-buffer. (D3D12_SHADER_BUFFER_DESC)
 * @remarks
 * Constants are supplied to shaders in a shader-constant buffer. Get the description of a shader-constant-buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionconstantbuffer-getdesc">ID3D12ShaderReflectionConstantBuffer::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_buffer_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_BUFFER_DESC {
    #StructPack 8

    /**
     * The name of the buffer.
     */
    Name : PSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_cbuffer_type">D3D_CBUFFER_TYPE</a>-typed value that indicates the intended use of the constant data.
     */
    Type : D3D_CBUFFER_TYPE

    /**
     * The number of unique variables.
     */
    Variables : UInt32

    /**
     * The size of the buffer, in bytes.
     */
    Size : UInt32

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags">D3D_SHADER_CBUFFER_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies properties for the shader constant-buffer.
     */
    uFlags : UInt32

}
