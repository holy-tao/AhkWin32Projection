#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader variable. (D3D11_SHADER_VARIABLE_DESC)
 * @remarks
 * Get a shader-variable description using reflection by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getdesc">ID3D11ShaderReflectionVariable::GetDesc</a>.
 *         
 * 
 * As of the June 2010 update, <b>DefaultValue</b> emits default values for reflection.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SHADER_VARIABLE_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable name.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from the start of the parent structure to the beginning of the variable.
     */
    StartOffset : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the variable (in bytes).
     */
    Size : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags">D3D_SHADER_VARIABLE_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value identifies shader-variable properties.
     */
    uFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPVOID</a></b>
     * 
     * The default value for initializing the variable.
     */
    DefaultValue : IntPtr

    /**
     * Type: <b>UINT</b>
     * 
     * Offset from the start of the variable to the beginning of the texture.
     */
    StartTexture : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the texture, in bytes.
     */
    TextureSize : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * Offset from the start of the variable to the beginning of the sampler.
     */
    StartSampler : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the sampler, in bytes.
     */
    SamplerSize : UInt32

}
