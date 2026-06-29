#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A state subobject that represents a shader configuration.
 * @remarks
 * A raytracing pipeline needs one raytracing shader configuration.  If multiple shader configurations are present, such as one in each collection to enable independent driver compilation for each one, they must all match when combined into a raytracing pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_SHADER_CONFIG {
    #StructPack 4

    /**
     * The maximum storage for scalars (counted as 4 bytes each) in ray payloads in raytracing pipelines that contain this program.
     */
    MaxPayloadSizeInBytes : UInt32

    /**
     * The maximum number of scalars (counted as 4 bytes each) that can be used for attributes in pipelines that contain this shader. The value cannot exceed <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_MAX_ATTRIBUTE_SIZE_IN_BYTES</a>.
     */
    MaxAttributeSizeInBytes : UInt32

}
