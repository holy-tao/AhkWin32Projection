#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader variable.
 * @remarks
 * 
 * Get a shader-variable description using reflection by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getdesc">ID3D12ShaderReflectionVariable::GetDesc</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The variable name.
     * @type {PSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Offset from the start of the parent structure to the beginning of the variable.
     * @type {Integer}
     */
    StartOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the variable (in bytes).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags">D3D_SHADER_VARIABLE_FLAGS</a>-typed values that are combined by using a bitwise-OR operation. 
     *             The resulting value identifies shader-variable properties.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The default value for initializing the variable.
     *             Emits default values for reflection.
     * @type {Pointer<Void>}
     */
    DefaultValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Offset from the start of the variable to the beginning of the texture.
     * @type {Integer}
     */
    StartTexture {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the texture, in bytes.
     * @type {Integer}
     */
    TextureSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Offset from the start of the variable to the beginning of the sampler.
     * @type {Integer}
     */
    StartSampler {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the sampler, in bytes.
     * @type {Integer}
     */
    SamplerSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
