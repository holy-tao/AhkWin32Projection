#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for view instancing.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VIEW_INSTANCING_FLAGS{

    /**
     * Indicates a default view instancing configuration.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_FLAG_NONE => 0

    /**
     * Enables view instance masking.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING => 1
}
