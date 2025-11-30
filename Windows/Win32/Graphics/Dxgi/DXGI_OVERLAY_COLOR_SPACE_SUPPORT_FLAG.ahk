#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies support for overlay color space.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/ne-dxgi1_4-dxgi_overlay_color_space_support_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG extends Win32BitflagEnum{

    /**
     * Overlay color space support is present.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT => 1
}
