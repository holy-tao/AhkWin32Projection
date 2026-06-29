#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader variable. (D3D12_SHADER_VARIABLE_DESC)
 * @remarks
 * Get a shader-variable description using reflection by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getdesc">ID3D12ShaderReflectionVariable::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_VARIABLE_DESC {
    #StructPack 8

    /**
     * The variable name.
     */
    Name : PSTR

    /**
     * Offset from the start of the parent structure to the beginning of the variable.
     */
    StartOffset : UInt32

    /**
     * Size of the variable (in bytes).
     */
    Size : UInt32

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags">D3D_SHADER_VARIABLE_FLAGS</a>-typed values that are combined by using a bitwise-OR operation. 
     *             The resulting value identifies shader-variable properties.
     */
    uFlags : UInt32

    /**
     * The default value for initializing the variable.
     *             Emits default values for reflection.
     */
    DefaultValue : IntPtr

    /**
     * Offset from the start of the variable to the beginning of the texture.
     */
    StartTexture : UInt32

    /**
     * The size of the texture, in bytes.
     */
    TextureSize : UInt32

    /**
     * Offset from the start of the variable to the beginning of the sampler.
     */
    StartSampler : UInt32

    /**
     * The size of the sampler, in bytes.
     */
    SamplerSize : UInt32

}
