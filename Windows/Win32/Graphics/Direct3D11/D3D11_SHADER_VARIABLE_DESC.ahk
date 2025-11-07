#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a shader variable.
 * @remarks
 * 
 * Get a shader-variable description using reflection by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getdesc">ID3D11ShaderReflectionVariable::GetDesc</a>.
 *         
 * 
 * As of the June 2010 update, <b>DefaultValue</b> emits default values for reflection.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable name.
     * @type {PSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from the start of the parent structure to the beginning of the variable.
     * @type {Integer}
     */
    StartOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the variable (in bytes).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags">D3D_SHADER_VARIABLE_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value identifies shader-variable properties.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPVOID</a></b>
     * 
     * The default value for initializing the variable.
     * @type {Pointer<Void>}
     */
    DefaultValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Offset from the start of the variable to the beginning of the texture.
     * @type {Integer}
     */
    StartTexture {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the texture, in bytes.
     * @type {Integer}
     */
    TextureSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Offset from the start of the variable to the beginning of the sampler.
     * @type {Integer}
     */
    StartSampler {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the sampler, in bytes.
     * @type {Integer}
     */
    SamplerSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
