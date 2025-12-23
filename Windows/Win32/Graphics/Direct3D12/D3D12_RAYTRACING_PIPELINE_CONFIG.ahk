#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A state subobject that represents a raytracing pipeline configuration.
 * @remarks
 * A raytracing pipeline needs one raytracing pipeline configuration. If multiple pipeline configurations are present, then they must all match in content. But there's no benefit to such duplication. For example, defining it once per collection doesn't help drivers do early shader compilation before a raytracing pipeline is created. This is unlike [D3D12_RAYTRACING_SHADER_CONFIG](/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config), which *does* benefit from duplication per collection.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_pipeline_config
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_PIPELINE_CONFIG extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * Limit on ray recursion for the raytracing pipeline. It must be in the range of 0 to 31. Below the maximum recursion depth, shader invocations such as closest hit or miss shaders can call **TraceRay** any number of times. At the maximum recursion depth, **TraceRay** calls result in the device going into removed state.
     * @type {Integer}
     */
    MaxTraceRecursionDepth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
