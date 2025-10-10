#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE.ahk

/**
 * Describes the properties of a ray dispatch operation initiated with a call to ID3D12GraphicsCommandList4::DispatchRays.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_dispatch_rays_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DISPATCH_RAYS_DESC extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The shader record for the ray generation shader to use.  
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes.
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE}
     */
    RayGenerationShaderRecord{
        get {
            if(!this.HasProp("__RayGenerationShaderRecord"))
                this.__RayGenerationShaderRecord := D3D12_GPU_VIRTUAL_ADDRESS_RANGE(this.ptr + 0)
            return this.__RayGenerationShaderRecord
        }
    }

    /**
     * The shader table for miss shaders.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE}
     */
    MissShaderTable{
        get {
            if(!this.HasProp("__MissShaderTable"))
                this.__MissShaderTable := D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE(this.ptr + 16)
            return this.__MissShaderTable
        }
    }

    /**
     * The shader table for hit groups.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>, and in the range [0...4096] bytes. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE}
     */
    HitGroupTable{
        get {
            if(!this.HasProp("__HitGroupTable"))
                this.__HitGroupTable := D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE(this.ptr + 40)
            return this.__HitGroupTable
        }
    }

    /**
     * The shader table for callable shaders.
     * 
     * The stride is record stride, and must be aligned to 32 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT</a>. 0 is allowed.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  
     * 
     * The address must be aligned to 64 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT</a>.
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE}
     */
    CallableShaderTable{
        get {
            if(!this.HasProp("__CallableShaderTable"))
                this.__CallableShaderTable := D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE(this.ptr + 64)
            return this.__CallableShaderTable
        }
    }

    /**
     * The width of the generation shader thread grid.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The height of the generation shader thread grid.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The depth of the generation shader thread grid.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
