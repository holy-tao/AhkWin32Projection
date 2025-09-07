#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the level of displayable surfaces supported in the current graphics driver.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_displayable
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_DISPLAYABLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the driver supports displayable surfaces; otherwise, `false`.
     * @type {Integer}
     */
    DisplayableTexture {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[D3D11_SHARED_RESOURCE_TIER](/windows/win32/api/d3d11/ne-d3d11-d3d11_shared_resource_tier)**
     * 
     * The level of support for shared resources in the current graphics driver.
     * @type {Integer}
     */
    SharedResourceTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
