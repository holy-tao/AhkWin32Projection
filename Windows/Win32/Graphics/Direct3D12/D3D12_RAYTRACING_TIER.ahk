#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the level of ray tracing support on the graphics device.
 * @remarks
 * 
  * To determine the supported ray tracing tier for a graphics device, pass <a href="../d3d12/ns-d3d12-d3d12_feature_data_d3d12_options5.md">D3D12_FEATURE_DATA_D3D12_OPTIONS5</a> struct.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_raytracing_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_TIER{

    /**
     * No support for ray tracing on the device.  Attempts to create any ray tracing-related object will fail, and using ray tracing-related APIs on command lists results in undefined behavior.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_TIER_NOT_SUPPORTED => 0

    /**
     * The device supports tier 1 ray tracing functionality. In the current release, this tier represents all available ray tracing features.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_TIER_1_0 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_TIER_1_1 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_TIER_1_2 => 12
}
