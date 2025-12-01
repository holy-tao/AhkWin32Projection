#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A state subobject that represents a shader configuration.
 * @remarks
 * A raytracing pipeline needs one raytracing shader configuration.  If multiple shader configurations are present, such as one in each collection to enable independent driver compilation for each one, they must all match when combined into a raytracing pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_SHADER_CONFIG extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The maximum storage for scalars (counted as 4 bytes each) in ray payloads in raytracing pipelines that contain this program.
     * @type {Integer}
     */
    MaxPayloadSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of scalars (counted as 4 bytes each) that can be used for attributes in pipelines that contain this shader. The value cannot exceed <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_MAX_ATTRIBUTE_SIZE_IN_BYTES</a>.
     * @type {Integer}
     */
    MaxAttributeSizeInBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
