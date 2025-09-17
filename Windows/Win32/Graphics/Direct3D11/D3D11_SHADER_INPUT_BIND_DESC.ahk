#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes how a shader resource is bound to a shader input. (D3D11_SHADER_INPUT_BIND_DESC)
 * @remarks
 * Get a shader-input-signature description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getresourcebindingdesc">ID3D11ShaderReflection::GetResourceBindingDesc</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getresourcebindingdescbyname">ID3D11ShaderReflection::GetResourceBindingDescByName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_INPUT_BIND_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the shader resource.
     * @type {Pointer<Byte>}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D_SHADER_INPUT_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D_SHADER_INPUT_TYPE</a>-typed value that identifies the type of data in the resource.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Starting bind point.
     * @type {Integer}
     */
    BindPoint {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of contiguous bind points for arrays.
     * @type {Integer}
     */
    BindCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_flags">D3D_SHADER_INPUT_FLAGS</a>-typed values for shader input-parameter options.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D_RESOURCE_RETURN_TYPE</a></b>
     * 
     * If the input is a texture, the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D_RESOURCE_RETURN_TYPE</a>-typed value that identifies the return type.
     * @type {Integer}
     */
    ReturnType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_srv_dimension">D3D_SRV_DIMENSION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_srv_dimension">D3D_SRV_DIMENSION</a>-typed value that identifies the dimensions of the bound resource.
     * @type {Integer}
     */
    Dimension {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of samples for a multisampled texture; when a texture isn't multisampled, the value is set to -1 (0xFFFFFFFF).
     * @type {Integer}
     */
    NumSamples {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
