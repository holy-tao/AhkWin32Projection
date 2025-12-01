#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Options for swap-chain color space.
 * @remarks
 * This enum is used by [**SetColorSpace**](../dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setcolorspace).
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_multiplane_overlay_ycbcr_flags
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS extends Win32BitflagEnum{

    /**
     * Specifies nominal range YCbCr, which isn't an absolute color space, but a way of encoding RGB info.
     * @type {Integer (Int32)}
     */
    static DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE => 1

    /**
     * Specifies BT.709, which standardizes the format of high-definition television and has 16:9 (widescreen) aspect ratio.
     * @type {Integer (Int32)}
     */
    static DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709 => 2

    /**
     * Specifies xvYCC or extended-gamut YCC (also x.v.Color) color space that can be used in the video electronics of television sets to support a gamut 1.8 times as large as that of the sRGB color space.
     * @type {Integer (Int32)}
     */
    static DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC => 4
}
