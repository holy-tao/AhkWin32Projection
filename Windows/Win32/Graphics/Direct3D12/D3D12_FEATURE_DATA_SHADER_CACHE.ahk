#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the level of shader caching supported in the current graphics driver. (D3D12_FEATURE_DATA_SHADER_CACHE)
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> to determine the level of support offered for the optional shader-caching features.
 * 
 * See the enumeration constant D3D12_FEATURE_SHADER_CACHE in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_cache
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_SHADER_CACHE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: [**D3D12_SHADER_CACHE_SUPPORT_FLAGS**](./ne-d3d12-d3d12_shader_cache_support_flags.md)
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_Out_</c>
     * 
     * Indicates the level of caching supported.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
