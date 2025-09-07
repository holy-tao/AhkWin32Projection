#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies color space support for the swap chain.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_swap_chain_color_space_support_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG{

    /**
     * Color space support is present.
     * @type {Integer (Int32)}
     */
    static DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT => 1

    /**
     * Overlay color space support is present.
     * @type {Integer (Int32)}
     */
    static DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT => 2
}
