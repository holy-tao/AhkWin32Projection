#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER.ahk" { D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates the level of support for 64KB-aligned MSAA textures, cross-API sharing, and native 16-bit shader operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options4
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS4 {
    #StructPack 4

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether 64KB-aligned MSAA textures are supported.
     */
    MSAA64KBAlignedTextureSupported : BOOL

    /**
     * Type: **[D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_shared_resource_compatibility_tier)**
     * 
     * Indicates the tier of cross-API sharing support.
     */
    SharedResourceCompatibilityTier : D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates native 16-bit shader operations are supported. These operations require shader model 6_2. For more information, see the [16-Bit Scalar Types](https://github.com/microsoft/DirectXShaderCompiler/wiki/16-Bit-Scalar-Types) HLSL reference.
     */
    Native16BitShaderOpsSupported : BOOL

}
