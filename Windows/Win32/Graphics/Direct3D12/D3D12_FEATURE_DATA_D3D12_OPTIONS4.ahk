#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support for 64KB-aligned MSAA textures, cross-API sharing, and native 16-bit shader operations.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options4
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS4 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether 64KB-aligned MSAA textures are supported.
     * @type {BOOL}
     */
    MSAA64KBAlignedTextureSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_shared_resource_compatibility_tier)**
     * 
     * Indicates the tier of cross-API sharing support.
     * @type {Integer}
     */
    SharedResourceCompatibilityTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates native 16-bit shader operations are supported. These operations require shader model 6_2. For more information, see the [16-Bit Scalar Types](https://github.com/microsoft/DirectXShaderCompiler/wiki/16-Bit-Scalar-Types) HLSL reference.
     * @type {BOOL}
     */
    Native16BitShaderOpsSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
