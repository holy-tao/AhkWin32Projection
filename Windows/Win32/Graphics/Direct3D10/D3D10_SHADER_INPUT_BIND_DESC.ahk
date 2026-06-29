#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_RESOURCE_RETURN_TYPE.ahk" { D3D_RESOURCE_RETURN_TYPE }
#Import "..\Direct3D\D3D_SHADER_INPUT_TYPE.ahk" { D3D_SHADER_INPUT_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Direct3D\D3D_SRV_DIMENSION.ahk" { D3D_SRV_DIMENSION }

/**
 * Describes how a shader resource is bound to a shader input. (D3D10_SHADER_INPUT_BIND_DESC)
 * @remarks
 * Get a shader-input-signature description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getresourcebindingdesc">ID3D10ShaderReflection::GetResourceBindingDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_INPUT_BIND_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the shader resource.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D10_SHADER_INPUT_TYPE</a></b>
     * 
     * Identifies the type of data in the resource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type">D3D10_SHADER_INPUT_TYPE</a>.
     */
    Type : D3D_SHADER_INPUT_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Starting bind point.
     */
    BindPoint : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of contiguous bind points for arrays.
     */
    BindCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader input-parameter options. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_shader_input_flags">D3D10_SHADER_INPUT_FLAGS</a>.
     */
    uFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D10_RESOURCE_RETURN_TYPE</a></b>
     * 
     * If the input is a texture, the return type. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D10_RESOURCE_RETURN_TYPE</a>.
     */
    ReturnType : D3D_RESOURCE_RETURN_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a></b>
     * 
     * Identifies the amount of data in the resource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a>.
     */
    Dimension : D3D_SRV_DIMENSION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of samples for a multisampled texture; otherwise 0.
     */
    NumSamples : UInt32

}
