#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes Direct3D 11.3 feature options in the current graphics driver.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d11_options3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D11_OPTIONS3 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Whether to use the VP and RT array index from any shader feeding the rasterizer.
     * @type {Integer}
     */
    VPAndRTArrayIndexFromAnyShaderFeedingRasterizer {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
