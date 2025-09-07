#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the level of support for render passes on a graphics device.
 * @remarks
 * To determine the level of support for render passes for a graphics device, pass <a href="../d3d12/ns-d3d12-d3d12_feature_data_d3d12_options5.md">D3D12_FEATURE_DATA_D3D12_OPTIONS5</a> struct.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_TIER{

    /**
     * The user-mode display driver hasn't implemented render passes, and so the feature is provided only via software emulation. Render passes might not provide a performance advantage at this level of support.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_TIER_0 => 0

    /**
     * The render passes feature is implemented by the user-mode display driver, and render target/depth buffer writes may be accelerated. Unordered access view (UAV) writes are not efficiently supported within the render pass.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_TIER_1 => 1

    /**
     * The render passes feature is implemented by the user-mode display driver, render target/depth buffer writes may be accelerated, and unordered access view (UAV) writes (provided that writes in a render pass are not read until a subsequent render pass) are likely to be more efficient than issuing the same work without using a render pass.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_TIER_2 => 2
}
