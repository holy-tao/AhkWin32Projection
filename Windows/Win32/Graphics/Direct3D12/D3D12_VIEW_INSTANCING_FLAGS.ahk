#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies options for view instancing.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_VIEW_INSTANCING_FLAGS extends Win32BitflagEnum {

    /**
     * Indicates a default view instancing configuration.
     * Native name: D3D12_VIEW_INSTANCING_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Enables view instance masking.
     * Native name: D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING
     * @type {Integer (Int32)}
     */
    static FLAG_ENABLE_VIEW_INSTANCE_MASKING => 1
}
