#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE }

/**
 * Describes the properties of a ray dispatch operation initiated with a call to ID3D12GraphicsCommandList4::DispatchRays.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dispatch_rays_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DISPATCH_RAYS_DESC {
    #StructPack 8

    /**
     * The shader record for the ray generation shader to use.  
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes.
     */
    RayGenerationShaderRecord : D3D12_GPU_VIRTUAL_ADDRESS_RANGE

    /**
     * The shader table for miss shaders.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     */
    MissShaderTable : D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE

    /**
     * The shader table for hit groups.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     */
    HitGroupTable : D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE

    /**
     * The shader table for callable shaders.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     */
    CallableShaderTable : D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE

    /**
     * The width of the generation shader thread grid.
     */
    Width : UInt32

    /**
     * The height of the generation shader thread grid.
     */
    Height : UInt32

    /**
     * The depth of the generation shader thread grid.
     */
    Depth : UInt32

}
