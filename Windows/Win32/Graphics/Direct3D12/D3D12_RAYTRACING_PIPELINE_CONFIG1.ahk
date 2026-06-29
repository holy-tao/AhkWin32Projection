#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RAYTRACING_PIPELINE_FLAGS.ahk" { D3D12_RAYTRACING_PIPELINE_FLAGS }

/**
 * A state subobject that represents a raytracing pipeline configuration, with flags.
 * @remarks
 * A raytracing pipeline needs one raytracing pipeline configuration. If multiple pipeline configurations are present, then they must all match in content. But there's no benefit to such duplication. For example, defining it once per collection doesn't help drivers do early shader compilation before a raytracing pipeline is created. This is unlike [D3D12_RAYTRACING_SHADER_CONFIG](/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config), which *does* benefit from duplication per collection.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_pipeline_config1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_PIPELINE_CONFIG1 {
    #StructPack 4

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * Limit on ray recursion for the raytracing pipeline. It must be in the range of 0 to 31. Below the maximum recursion depth, shader invocations such as closest hit or miss shaders can call **TraceRay** any number of times. At the maximum recursion depth, **TraceRay** calls result in the device going into removed state.
     */
    MaxTraceRecursionDepth : UInt32

    /**
     * Type: **[D3D12_RAYTRACING_PIPELINE_FLAGS](./ne-d3d12-d3d12_raytracing_pipeline_flags.md)**
     * 
     * Configuration flags for the raytracing pipeline.
     */
    Flags : D3D12_RAYTRACING_PIPELINE_FLAGS

}
