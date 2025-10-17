#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes how a shader resource is bound to a shader input.
 * @remarks
 * 
  * Get a shader-input-signature description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdesc">ID3D12ShaderReflection::GetResourceBindingDesc</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdescbyname">ID3D12ShaderReflection::GetResourceBindingDescByName</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_INPUT_BIND_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Name of the shader resource.
     * @type {PSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D_SHADER_INPUT_TYPE</a>-typed value that identifies the type of data in the resource.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Starting bind point.
     * @type {Integer}
     */
    BindPoint {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of contiguous bind points for arrays.
     * @type {Integer}
     */
    BindCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_flags">D3D_SHADER_INPUT_FLAGS</a>-typed values for shader input-parameter options.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * If the input is a texture, the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D_RESOURCE_RETURN_TYPE</a>-typed value that identifies the return type.
     * @type {Integer}
     */
    ReturnType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_srv_dimension">D3D_SRV_DIMENSION</a>-typed value that identifies the dimensions of the bound resource.
     * @type {Integer}
     */
    Dimension {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The number of samples for a multisampled texture; when a texture isn't multisampled, the value is set to -1 (0xFFFFFFFF).
     *             This is zero if the shader resource is not a recognized texture.
     * @type {Integer}
     */
    NumSamples {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The register space.
     * @type {Integer}
     */
    Space {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The range ID in the bytecode.
     * @type {Integer}
     */
    uID {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
