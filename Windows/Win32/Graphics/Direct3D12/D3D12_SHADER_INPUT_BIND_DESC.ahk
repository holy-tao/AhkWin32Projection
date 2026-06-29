#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_RESOURCE_RETURN_TYPE.ahk" { D3D_RESOURCE_RETURN_TYPE }
#Import "..\Direct3D\D3D_SHADER_INPUT_TYPE.ahk" { D3D_SHADER_INPUT_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Direct3D\D3D_SRV_DIMENSION.ahk" { D3D_SRV_DIMENSION }

/**
 * Describes how a shader resource is bound to a shader input. (D3D12_SHADER_INPUT_BIND_DESC)
 * @remarks
 * Get a shader-input-signature description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdesc">ID3D12ShaderReflection::GetResourceBindingDesc</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdescbyname">ID3D12ShaderReflection::GetResourceBindingDescByName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_INPUT_BIND_DESC {
    #StructPack 8

    /**
     * Name of the shader resource.
     */
    Name : PSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D_SHADER_INPUT_TYPE</a>-typed value that identifies the type of data in the resource.
     */
    Type : D3D_SHADER_INPUT_TYPE

    /**
     * Starting bind point.
     */
    BindPoint : UInt32

    /**
     * Number of contiguous bind points for arrays.
     */
    BindCount : UInt32

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_flags">D3D_SHADER_INPUT_FLAGS</a>-typed values for shader input-parameter options.
     */
    uFlags : UInt32

    /**
     * If the input is a texture, the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D_RESOURCE_RETURN_TYPE</a>-typed value that identifies the return type.
     */
    ReturnType : D3D_RESOURCE_RETURN_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_srv_dimension">D3D_SRV_DIMENSION</a>-typed value that identifies the dimensions of the bound resource.
     */
    Dimension : D3D_SRV_DIMENSION

    /**
     * The number of samples for a multisampled texture; when a texture isn't multisampled, the value is set to -1 (0xFFFFFFFF).
     *             This is zero if the shader resource is not a recognized texture.
     *             If the shader resource is a structured buffer, the field contains the stride of the type in bytes.
     */
    NumSamples : UInt32

    /**
     * The register space.
     */
    Space : UInt32

    /**
     * The range ID in the bytecode.
     */
    uID : UInt32

}
