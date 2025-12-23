#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes whether an opacity mask contains graphics or text. Direct2D uses this information to determine which gamma space to use when blending the opacity mask.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_opacity_mask_content
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_OPACITY_MASK_CONTENT extends Win32Enum{

    /**
     * The opacity mask contains graphics. The opacity mask is blended in the gamma 2.2 color space.
     * @type {Integer (Int32)}
     */
    static D2D1_OPACITY_MASK_CONTENT_GRAPHICS => 0

    /**
     * The opacity mask contains non-GDI text. The gamma space used for blending is obtained from the render target's text rendering parameters. (<a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextrenderingparams">ID2D1RenderTarget::SetTextRenderingParams</a>).
     * @type {Integer (Int32)}
     */
    static D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL => 1

    /**
     * The opacity mask contains text rendered using the GDI-compatible rendering mode. The opacity mask is blended using the gamma for GDI rendering.
     * @type {Integer (Int32)}
     */
    static D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE => 2
}
