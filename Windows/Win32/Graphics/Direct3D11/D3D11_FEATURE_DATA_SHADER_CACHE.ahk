#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the level of shader caching supported in the current graphics driver.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">CheckFeatureSupport</a> to determine the level of support offered for the optional shader-caching features.
  * 
  * See the enumeration constant D3D11_FEATURE_SHADER_CACHE in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_shader_cache
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_SHADER_CACHE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the level of caching supported.
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
