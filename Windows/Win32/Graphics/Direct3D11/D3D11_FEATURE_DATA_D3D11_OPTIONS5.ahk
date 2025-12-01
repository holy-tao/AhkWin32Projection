#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the level of support for shared resources in the current graphics driver.
 * @remarks
 * Use this structure with the **D3D11_FEATURE_D3D11_OPTIONS5** member of [D3D11_FEATURE](./ne-d3d11-d3d11_feature.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options5
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D11_OPTIONS5 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: **[D3D11_SHARED_RESOURCE_TIER](./ne-d3d11-d3d11_shared_resource_tier.md)**
     * 
     * The level of support for shared resources in the current graphics driver.
     * @type {Integer}
     */
    SharedResourceTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
