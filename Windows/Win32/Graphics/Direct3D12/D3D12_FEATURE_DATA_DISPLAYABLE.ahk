#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER.ahk

/**
 * This feature is currently in preview.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_displayable
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FEATURE_DATA_DISPLAYABLE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    DisplayableTexture {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER}
     */
    SharedResourceCompatibilityTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
