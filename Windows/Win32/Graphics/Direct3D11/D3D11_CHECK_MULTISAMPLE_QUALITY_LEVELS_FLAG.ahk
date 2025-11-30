#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies how to check multisample quality levels.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/ne-d3d11_2-d3d11_check_multisample_quality_levels_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAG extends Win32Enum{

    /**
     * Indicates to check the multisample quality levels of a tiled resource.
     * @type {Integer (Int32)}
     */
    static D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_TILED_RESOURCE => 1
}
